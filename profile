export PLAN9=/usr/local/plan9
export GOROOT=/usr/local/go
export GOPATH=$HOME/Code

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/Code/git-remote-hg
export PATH=$PATH:$HOME/Code/moz-git-tools
export PATH=$PATH:/usr/local/adt/sdk/platform-tools

export EDITOR=E

export CCACHE_DIR=$HOME/.config/ccache
export CCACHE_UMASK=002
#export CCACHE_PREFIX=distcc
#export DISTCC_HOSTS=+zeroconfig

export GIT_AUTHOR_EMAIL=ato@mozilla.com
export GITHUB_USER=andreastt
export HGRCPATH=$HOME/.config/hgrc
export I_PREFER_A_SUBOPTIMAL_MERCURIAL_EXPERIENCE=1

# Other configuration options
export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1
export GAIATEST_SKIP_WARNING=1
export GECKO_PATH=$HOME/Code/gecko/src
export GECKO_OBJDIR=$HOME/Code/gecko/build/b2g

# Selenium test suites will continue running
# even if they reach an error or fail.
export haltonerror=0
export haltonfailure=0

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b o -p all -u all -t none"
export trymarionette="-b o -p linux,linux64_gecko -u marionette,marionette-e10s,web-platform-tests-1,marionette-webapi,gaia-ui-test-functional,gaia-js-integration -t none"

alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias sl=ls

PS1="% "
export HISTCONTROL=ignoreboth
