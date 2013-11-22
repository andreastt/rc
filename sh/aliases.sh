# ack is named ack-grep in Debian, rename
alias ack="ack-grep"

# Push and pop directories on directory stack
alias pu="pushd"
alias po="'popd"

# Basic directory operations
alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias md="mkdir -p"
alias rd=rmdir

alias reload="source ~/.zshrc"

# List direcory contents
alias ls="ls -G"
alias la="ls -ah"
alias l="ls -lah"
alias sl=ls

# Commonly used programs
alias emacs="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias e="emacs -c"
alias en="emacs -nw"
alias ew="emacs --no-wait -c"

# Other machines
alias njord="ssh -YC ato@sny.no"
alias eir="ssh -YC ato@eir.corp.lon1.mozilla.com"
