export TERM=xterm
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'

export PAGER=less
export EDITOR="emacs -nw"
export MAILTO=ato@sny.no

# local bin
export PATH=$PATH:$HOME/bin

# depot tools
export PATH=$PATH:$HOME/dev/depot_tools

# Plan 9
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin

# Go
export PATH="$HOME/dev/go/bin:$PATH"
export GOROOT="$HOME/dev/go"

# Compilation
#export CC="ccache clang"
#export CXX="ccache clang++"
#export ICECC_CC="icecc $CC"
#export ICECC_CXX="icecc $CXX"

export GYP_GENERATORS=ninja
export GYP_PARALLEL=1

export DISTCC_HOSTS="localhost/4 id-6895.users.oslo.osa/8"

# Selenium test suites will continue running even if they reach an error or fail
export haltonerror=0
export haltonfailure=0

# Goth
export GOTH=~/dev/goth/client
export PATH="$PATH:$GOTH/bin"

export GITHUB_USER="andreastt"

# Python
export PYTHONSTARTUP=~/.pythonrc.py
export PYTHONDONTWRITEBYTECODE=1
