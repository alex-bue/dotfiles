#!/bin/sh

# use neovim for vim if present
if command -v nvim >/dev/null 2>&1; then
  alias v='nvim'
  alias vim='nvim'
  alias vimdiff='nvim -d'
fi

# verbosity and settings that you pretty much just always are going to want.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias bc="bc -ql"

#ls() { command -v eza >/dev/null 2>&1 && command eza --git --icons "$@" || command ls "$@"; }
#la() { command -v eza >/dev/null 2>&1 && command eza -a --git --icons "$@" || command ls -la "$@"; }
#ll() { command -v eza >/dev/null 2>&1 && command eza -lab --git --icons "$@" || command ls -al "$@"; }
#tree() { command -v eza >/dev/null 2>&1 && command eza --tree --icons "$@" || command tree "$@"; }

# chezmoi
alias d="chezmoi cd"
alias ca="chezmoi apply"
alias ce="chezmoi edit"

# tmux
alias ta="tmux attach"
alias td="tmux detach"

# lazygit
alias lg="lazygit"

# git aliases (cherrypicked from oh-my-zsh plugin)
alias ga="git add"
alias gaa="git add --all"
alias gau="git add --update"
alias gb="git branch"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gcam="git commit -a -m"
alias gcmsg="git commit -m"
alias gcf="git config --list"
alias gco="git checkout"
alias gsw="git switch"
alias gd="git diff"
alias gf="git fetch"
alias gp="git push"
alias gpom="git push origin main"
alias gpl="git pull"
alias gr="git remote"
alias grs="git remote show"
alias gst="git status"
alias glog='git log --oneline --decorate --graph'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
