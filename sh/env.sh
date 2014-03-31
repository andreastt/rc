# Paths.
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/dev/moz-git-tools
export PATH=$PATH:/usr/local/adt/sdk/platform-tools

# Plumb files instead of starting new editor, get rid of backspace characters
# in UNIX man output, and use a free browser!
export EDITOR=E
unset FCEDIT VISUAL
export PAGER=nobs

if [[ `uname` == "Linux" ]]; then
	export BROWSER=firefox-trunk
else
	export BROWSER=FirefoxNightly
fi

# acme
export font=$PLAN9/font/lucsans/euro.8.font
export home=$HOME
export prompt="$H=% "
export user=$USER

# Compilation and distributed compilation
#export CC="clang"
#export CXX="clang++"
#export CCACHE_PREFIX="distcc"
export DISTCC_HOSTS="+zeroconfig"

# Selenium test suites will continue running even if they reach an error or
# fail.
export haltonerror=0
export haltonfailure=0

# I go by a different name on Githoob.
export GITHUB_USER="andreastt"

# Language specificness.
#
# Autoload some Python modules in the REPL and please stop littering my
# directories with .pyc files.
export PYTHONSTARTUP=~/.pythonrc.py
export PYTHONDONTWRITEBYTECODE=1
export GOROOT=$HOME/dev/go

# Mozilla's try server shortcuts because these are almost impossible to
# remember.
export TRY_ALL="-b do -p all -u all -t none"
export TRY_MOBILE="-b do -p emulator,panda -u marionette-webapi -t none"
export TRY_DESKTOP="-b linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"
