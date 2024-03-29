#!/usr/bin/env zsh

# Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit

# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' enable git svn
zstyle ':vcs_info:git*' formats " (%b%u%c)"
zstyle ':vcs_info:git*' actionformats " (%b%u%c %a)"
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr "?"
zstyle ':vcs_info:git*' stagedstr "+"
precmd() { vcs_info }
setopt prompt_subst

PROMPT='%F{cyan}%~%F{green}${vcs_info_msg_0_}%F{red}: %f'

export LANG=en_GB.UTF-8

export EDITOR=vim
export VISUAL=$EDITOR

export GPG_TTY=$(tty)

# zsh thinks EDITOR=vim means I want vim bindings
bindkey -e

function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

function zle_fg {
    zle_eval fg
}

zle -N zle_fg
bindkey "^z" zle_fg

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

export CLICOLOR=1

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias frhist="cat ~/.zsh_history | sort | uniq -c | sort -rn | head"
alias frhistc="cat ~/.zsh_history | sort | uniq -c | sort -rn | head"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias e="$EDITOR"
alias ec="emacsclient -n"
alias g="git"
alias l="ls -al"
