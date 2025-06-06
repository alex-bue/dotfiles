#!/bin/sh

# use neovim for vim if present
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# verbosity and settings that you pretty much just always are going to want.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias bc="bc -ql"

# if command -v eza >/dev/null; then
#   alias l="eza --icons"
#   alias ls="eza --git --icons"
#   alias la="eza --git -a --icons"
#   alias ll="eza -lab --git --icons"
#   alias tree="eza --tree --icons"
# else
#   alias l="ls --color=auto"
#   alias ls="ls --color=auto"
#   alias la="ls -la"
#   alias ll="ls -al"
# fi
#
# chezmoi
alias d="chezmoi cd"
alias ca="chezmoi apply"
alias ce="chezmoi edit"

# tmux
alias ta="tmux attach"
alias td="tmux detach"

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
