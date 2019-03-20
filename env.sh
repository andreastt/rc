export PATH=$HOME/bin:$PATH
export PATH=$PATH:/usr/local/plan9/bin
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
