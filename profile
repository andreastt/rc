export PLAN9=/usr/local/plan9
export GOROOT=/usr/local/go
export GOPATH=$HOME/Code

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$GOPATH/bin

export EDITOR=E

export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b o -p all -u all -t none"
export trymn="-b o -e -p linux64,linux64-mulet,macosx64,win64,linux64_gecko -u marionette,marionette-e10s,luciddream,web-platform-tests,marionette-webapi,gaia-ui-test-functional,gaia-js-integration -t none"

alias .="pwd"
alias ..="cd .."

PS1="% "
