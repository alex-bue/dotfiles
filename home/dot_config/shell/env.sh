# Shared by Bash and Zsh. This runs after login-shell startup.
for dir in "$HOME/bin" "$HOME/.local/bin"; do
  case ":$PATH:" in
    *":$dir:"*) ;;
    *) PATH="$dir:$PATH" ;;
  esac
done
export PATH
unset dir

export FZF_DEFAULT_OPTS='--height=45% --layout=reverse --border --cycle --preview-window=right,55%'
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_ALT_C_OPTS='--preview="eza -la --color=always {} 2>/dev/null || ls -la {}"'

shell_tools_init() {
  if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate "$1")"
  fi
  if command -v nvim >/dev/null 2>&1; then
    export NVIM_APPNAME=lazyvim
    export EDITOR=nvim VISUAL=nvim
  fi
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git'
  fi
  if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init "$1")"
  fi
  if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook "$1")"
  fi
}

zi() {
  local dir
  command -v zoxide >/dev/null && command -v fzf >/dev/null || return 127
  dir="$(zoxide query -l | fzf --prompt='zoxide> ' --tac --no-sort --exact)" || return
  builtin cd -- "$dir"
}

y() {
  local tmp cwd rc
  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return
  command yazi "$@" --cwd-file="$tmp"
  rc=$?
  IFS= read -r -d '' cwd < "$tmp" || :
  if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && [ -d "$cwd" ]; then
    builtin cd -- "$cwd" || rc=$?
  fi
  command rm -f -- "$tmp"
  return "$rc"
}
