#!/bin/sh
set -eu

scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
export HOME="$scratch/home"
mkdir "$HOME"
unset XDG_CONFIG_HOME XDG_DATA_HOME XDG_CACHE_HOME XDG_STATE_HOME
export PATH="$HOME/.local/bin:$PATH"

./install.sh
chezmoi --source="$PWD" verify
[ -f "$HOME/.config/lazyvim/init.lua" ]
[ -f "$HOME/.p10k.zsh" ]
[ ! -e "$HOME/.bashrc" ]
[ ! -e "$HOME/.config/mise" ]

ln -s /nix/store/check-home-manager-collision "$HOME/.bashrc"
if ./install.sh --portable --skip-tools; then
  echo 'portable bootstrap did not reject the Nix-managed target' >&2
  exit 1
fi
[ "$(readlink "$HOME/.bashrc")" = /nix/store/check-home-manager-collision ]
[ ! -e "$HOME/.config/herdr/config.toml" ]
rm "$HOME/.bashrc"

./install.sh --portable
./install.sh --portable
chezmoi --source="$PWD" --override-data='{"portable":true}' verify
[ -f "$HOME/.config/herdr/config.toml" ]
[ -f "$HOME/.config/starship.toml" ]
[ -x "$HOME/.local/bin/tmux-session-picker" ]
case $(uname -s) in
  Darwin)
    [ -f "$HOME/.config/aerospace/aerospace.toml" ]
    [ -f "$HOME/.config/karabiner/karabiner.json" ] ;;
  Linux)
    [ ! -e "$HOME/.config/aerospace" ]
    [ ! -e "$HOME/.config/karabiner" ] ;;
esac

[ "$(git config --global --get init.defaultBranch)" = main ]
TERM=xterm-256color bash -ic 'test "$EDITOR" = nvim && type z y >/dev/null'
mise -C "$HOME" exec -- sh -ec '
  for tool in direnv fd fzf gh herdr just lazygit nvim rg sesh starship tree-sitter uv yazi zoxide; do
    "$tool" --version >/dev/null
  done
  if [ "$(uname -s)" = Linux ]; then eza --version >/dev/null; fi
  tmux -V
  export TERM=xterm-256color
  tmux -S "$HOME/tmux-test.sock" -f "$HOME/.config/tmux/tmux.conf" new-session -d
  trap '\''tmux -S "$HOME/tmux-test.sock" kill-server'\'' EXIT
  [ "$(tmux -S "$HOME/tmux-test.sock" show-option -gv prefix)" = C-Space ]
  tmux -S "$HOME/tmux-test.sock" show-option -gv status-right | grep -q continuum_save
'
