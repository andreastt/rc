export PLAN9=/usr/local/plan9
export CARGO=$HOME/.cargo
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$CARGO/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.mozbuild/version-control-tools/git/commands
export PATH=$PATH:$HOME/src/moz-git-tools

export NAMESPACE=/tmp/ns.$USER.:0
export EDITOR=E
export PAGER=nobs

export RUSTC_WRAPPER=sccache
export CARGO_INCREMENTAL=1
export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1
export DEBIAN_FRONTEND=noninteractive

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b do -p all -u all -t none"
export trymn="-b do -p linux64,macosx64,win64,android-api-16 -u marionette-e10s,marionette-headless-e10s,xpcshell,web-platform-tests,firefox-ui-functional-local-e10s,firefox-ui-functional-remote-e10s -t none"

