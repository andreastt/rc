# non-login shells do not source /etc/profile.d/*
. /etc/profile.d/env.sh

alias .="pwd"
alias ..="cd .."
alias l="ls"
alias ls="ls --color"
alias open="xdg-open"

PS1="% "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

