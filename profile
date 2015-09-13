export PLAN9=/usr/local/plan9
export GOROOT=/usr/local/go
export GOPATH=$HOME/Code

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$GOPATH/bin

export EDITOR=E

# Other configuration options
export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b o -p all -u all -t none"
export trymarionette="-b o -p linux,linux64_gecko -u marionette,marionette-e10s,web-platform-tests-1,marionette-webapi,gaia-ui-test-functional,gaia-js-integration -t none"

alias .="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

PS1="% "