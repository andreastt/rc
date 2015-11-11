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
export trymn="-b do -e -p linux64,linux64-mulet,macosx64,win64,linux64_gecko -u marionette[x64,Mulet Linux,10.6,Windows 8,b2g],marionette-e10s[x64,Mulet Linux,10.6,Windows 8,b2g],luciddream[x64,Mulet Linux,10.6,Windows 8,b2g],web-platform-tests[x64,Mulet Linux,10.6,Windows 8,b2g],marionette-webapi[x64,Mulet Linux,10.6,Windows 8,b2g],gaia-unit[x64,Mulet Linux,10.6,Windows 8,b2g],gaia-js-integration[x64,Mulet Linux,10.6,Windows 8,b2g] -t none"

alias .="pwd"
alias ..="cd .."

PS1="% "

