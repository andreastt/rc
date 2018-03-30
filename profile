# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh

alias .="pwd"
alias ..="cd .."
alias l="ls -p"
alias ll="ls -Glhp"
alias ls="ls -G"

PS1="% "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
