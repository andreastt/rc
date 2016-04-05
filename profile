# non-login shells do not source /etc/profile.d/*
. /etc/profile.d/env.sh

alias .="pwd"
alias ..="cd .."
alias ls="ls --color"

PS1="% "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

