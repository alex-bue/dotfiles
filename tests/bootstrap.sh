#!/bin/sh
set -eu

scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
export HOME="$scratch/home"
mkdir "$HOME"
unset XDG_CONFIG_HOME XDG_DATA_HOME XDG_CACHE_HOME XDG_STATE_HOME
export PATH="$HOME/.local/bin:$PATH"

if ! command -v chezmoi >/dev/null; then
  installer="$(curl -fsSL https://chezmoi.io/get)"
  sh -c "$installer" -- -b "$HOME/.local/bin"
fi

cm() { chezmoi --source="$PWD" "$@"; }

# Unattended setup never guesses an identity on a fresh account.
cm init --promptDefaults
cm cat "$HOME/.config/git/config" > "$scratch/git.config"
[ "$(git config --file "$scratch/git.config" --get user.useConfigOnly)" = true ]
if git config --file "$scratch/git.config" --get user.email; then exit 1; fi

# Offer the account's existing identity without inferring anything from the host.
git config --file "$HOME/.gitconfig" user.name 'Existing User'
git config --file "$HOME/.gitconfig" user.email existing@example.invalid
cm init --prompt --promptDefaults
cm cat "$HOME/.config/git/config" > "$scratch/git.config"
[ "$(git config --file "$scratch/git.config" --get user.email)" = existing@example.invalid ]
rm "$HOME/.gitconfig"

# Pass local values without relying on an interactive terminal.
cm init --apply --prompt --promptString 'Git name=Example User,Git email=vm@example.invalid'
[ "$(git config --global --get user.name)" = 'Example User' ]
[ "$(git config --global --get user.email)" = vm@example.invalid ]
[ "$(git config --global --get init.defaultBranch)" = main ]

# Another init/apply keeps the answers and does not reinstall the tools.
cm init --apply --promptDefaults
cm verify --exclude=scripts
[ "$(git config --global --get user.email)" = vm@example.invalid ]
[ -f "$HOME/.config/lazyvim/init.lua" ]
[ -f "$HOME/.config/herdr/config.toml" ]
[ -f "$HOME/.config/starship.toml" ]
[ ! -e "$HOME/.config/tmux" ]
[ ! -e "$HOME/.local/bin/tmux-session-picker" ]
if grep -Eq 'tmux-builds|joshmedeski/sesh' "$HOME/.config/mise/conf.d/10-dotfiles.toml"; then
  echo 'The default tool list unexpectedly includes tmux or sesh.' >&2
  exit 1
fi

TERM=xterm-256color bash -ic 'test "$EDITOR" = nvim && type z y >/dev/null'
if command -v zsh >/dev/null; then
  TERM=xterm-256color zsh -ic '
    [[ $EDITOR == nvim ]] && whence z y >/dev/null &&
      [[ $(bindkey "^I") == *" fzf-tab-complete" ]] &&
      (( $+widgets[autosuggest-accept] && $+functions[_zsh_highlight] ))
  '
else
  [ ! -e "$HOME/.config/zsh/plugins" ]
fi
mise -C "$HOME" exec -- sh -ec '
  for tool in direnv fd fzf gh herdr just lazygit nvim rg starship tree-sitter uv yazi zoxide; do
    "$tool" --version >/dev/null
  done
  if [ "$(uname -s)" = Linux ]; then eza --version >/dev/null; fi
'
