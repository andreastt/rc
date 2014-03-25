# Plan 9
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin

# Local bin
export PATH=$PATH:$HOME/bin

# moz-git-tools
export PATH=$PATH:$HOME/dev/moz-git-tools

# Go
export GOROOT=$HOME/dev/go

# Android
export PATH=$PATH:/usr/local/adt/sdk/platform-tools

# Plumb files instead of starting new editor
export EDITOR=E
unset FCEDIT VISUAL

# Get rid of backspace characters in UNIX man output
export PAGER=nobs

export BROWSER=FirefoxNightly

# acme font
export font=$PLAN9/font/lucsans/euro.8.font

# Equivalent variables for rc(1)
export home=$HOME
export prompt="$H=;          "
export user=$USER

# Compilation and distributed compilation
#export CC="clang"
#export CXX="clang++"
#export CCACHE_PREFIX="distcc"
export DISTCC_HOSTS="+zeroconfig"

export GYP_GENERATORS=ninja
export GYP_PARALLEL=1

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
export TRY_ALL="-b do -p all -u all -t none"
export TRY_MOBILE="-b do -p emulator,panda -u marionette-webapi -t none"
export TRY_DESKTOP="-b linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"
