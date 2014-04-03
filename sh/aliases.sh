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
alias e="emacsclient -c"
alias en="emacsclient -nw"
alias ew="emacsclient --no-wait -c"

# Set correct location to system Emacs on OS X
if [[ "$(uname)" = "Darwin" ]]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
fi

# `date` should always display ISO-8601 format
alias date="date --iso-8601='seconds' | rev | cut -c 1- | rev"
