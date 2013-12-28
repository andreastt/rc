# ack is named ack-grep in Debian.  Assume that Linux == Debian here.
if [[ `uname` == "Linux" ]]; then
    alias ack="ack-grep"
fi

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

if [[ "$(uname)" = "Darwin" ]]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
fi

# Other machines
alias njord="ssh -YC ato@sny.no"
alias eir="ssh -YC ato@eir.corp.lon1.mozilla.com"

alias date="date --iso-8601='seconds'"
