export PLAN9=/usr/local/plan9
export CARGO=$HOME/.cargo
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$CARGO/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/src/git-cinnabar
export PATH=$PATH:$HOME/.mozbuild/version-control-tools/git/commands

export EDITOR=E

export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1
export DEBIAN_FRONTEND=noninteractive

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b do -e -p all -u all -t none"
export trymn="-b do -e -p linux64,macosx64,win64,android-api-15 -u xpcshell,marionette,marionette-e10s,web-platform-tests,firefox-ui-functional,firefox-ui-functional-e10s,media-tests,media-youtube-tests,reftest,mochitest -t none"
