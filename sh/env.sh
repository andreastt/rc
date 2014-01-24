export PAGER=less
export EDITOR="e"
export MAILTO=ato@sny.no

# local bin
export PATH=$PATH:$HOME/bin

# depot tools
export PATH=$PATH:$HOME/dev/depot_tools

# moz-git-tools
export PATH=$PATH:$HOME/dev/moz-git-tools

# Plan 9
export PLAN9=$HOME/bin/plan9
export PATH=$PATH:$PLAN9/bin

# Go
export PATH="$HOME/dev/go/bin:$PATH"
export GOROOT="$HOME/dev/go"

# Compilation
#export CC="clang"
#export CXX="clang++"
export ICECC_CC="icecc $CC"
export ICECC_CXX="icecc $CXX"

export GYP_GENERATORS=ninja
export GYP_PARALLEL=1

# TODO: DISTCC_HOSTS

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

# Try
export TRY_MOBILE="-b do -p emulator,panda -u marionette-webapi -t none"
export TRY_DESKTOP="-b linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"
