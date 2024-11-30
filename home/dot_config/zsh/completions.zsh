# completions
autoload -Uz compinit && compinit

zinit cdreplay -q

zstyle ':completion:*' menu no                              # Disable zsh complete menus (because plugin handles them)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Color the completions
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # Use fzf tab for cd completions

#TODO: Do I need these?
# zmodload zsh/complist
# compinit -C
# _comp_options+=(globdots)       # Complete hidden(dot)files

