# ack is named ack-grep in Debian, rename
alias ack="ack-grep"

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'

alias md='mkdir -p'
alias rd=rmdir

alias h='cd ~/'

alias reload='source ~/.zshrc'

# Super user
alias _='sudo'

# List direcory contents
alias ls='ls -G'
alias la='ls -ah'
alias l='ls -lah'
alias sl=ls

# Commonly used programs
alias e="emacs -nw"
alias v=vim

# Other machines
alias njord='ssh -XC -c blowfish-cbc,arcfour ato@sny.no'
alias work='ssh -XC andreastt@id-6895.users.oslo.osa'
