export PAGER=less
export EDITOR=vim
export TERMINAL=xterm

# local bin
export PATH=$PATH:$HOME/bin

# depot tools
export PATH=$PATH:$HOME/dev/depot_tools

# Plan 9
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin

# Go
#export PATH="/usr/local/go/bin:$PATH"
#export PATH="$HOME/bin/go/bin:/usr/local/go/bin:$PATH"
export PATH="$HOME/bin/go/bin:$PATH"
export GOROOT="$HOME/bin/go"

# Compilation
#export CC="ccache clang"
#export CXX="ccache clang++"
#export ICECC_CC="icecc $CC"
#export ICECC_CXX="icecc $CXX"

export GYP_GENERATORS=ninja
export GYP_PARALLEL=1

# Selenium test suites will continue running even if they reach an error or fail
export haltonerror=0
export haltonfailure=0

export GITHUB_USER="andreastt"
