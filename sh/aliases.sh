# ack is named ack-grep in Debian, rename
alias ack="ack-grep"

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias md='mkdir -p'
alias rd=rmdir

alias reload='source ~/.zshrc'

# List direcory contents
alias ls='ls -G'
alias la='ls -ah'
alias l='ls -lah'
alias sl=ls

# Commonly used programs
alias e="emacs -nw"

# Other machines
alias njord='ssh -XC ato@sny.no'
alias work='ssh -XC andreastt@id-6895.users.oslo.osa'
