alias .="pwd"
alias ..="cd .."
alias ls="ls --color"

PS1="% "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

