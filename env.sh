export PLAN9=/usr/local/plan9

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/src/git-cinnabar
export PATH=$PATH:$HOME/src/phlay

export NAMESPACE=${TMPDIR}ns.ato.default
export EDITOR=E

export RUSTC_WRAPPER=sccache
export CARGO=$HOME/.cargo/bin/cargo
export CCACHE_PREFIX=icecc
export SCCACHE_REDIS=redis://icecc-scheduler.corp.lon2.mozilla.com
export PYTHONDONTWRITEBYTECODE=1

export MACH_NO_TERMINAL_FOOTER=1
export MOZ_NOSPAM=1
export DEBIAN_FRONTEND=noninteractive

# Mozilla's try server shortcuts
# because these are almost impossible to remember
export tryall="-b do -p all -u all -t none"
export trymn="-b do -p linux,linux64,macosx64,win64,android-api-16 -u marionette,marionette-e10s,marionette-headless-e10s,xpcshell,web-platform-tests,firefox-ui-functional-local-e10s,firefox-ui-functional-remote-e10s -t none"
