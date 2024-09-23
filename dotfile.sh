#!/bin/bash

# ~/.bashrc: started by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# CLI Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

# Path to custom scripts
export PATH=$PATH:$HOME/bin

# Enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Custom functions
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1    ;;
            *.tar.gz)    tar xzf $1    ;;
            *.bz2)       bunzip2 $1    ;;
            *.rar)       unrar e $1    ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1     ;;
            *.tbz2)      tar xjf $1    ;;
            *.tgz)       tar xzf $1    ;;
            *.zip)       unzip $1      ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Environment variables
export EDITOR=nano
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000
export HISTFILESIZE=2000

# Enable persistent history across sessions
shopt -s histappend

# Load pyenv automatically:
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# Aliases for git
alias gst='git status'
alias gco='git checkout'
alias gcm='git commit'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source user-specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
