alias .="pwd"
alias ..="cd .."

PS1="% "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
