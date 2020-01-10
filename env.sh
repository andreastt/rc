export PLAN9=/usr/local/plan9
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin
export PATH=$PATH:$HOME/src/git-cinnabar
export PATH=$PATH:$HOME/src/phlay
export PATH=$PATH:$HOME/src/review

TMPDIR=${TMPDIR:-/tmp/}
NAMESPACE=${NAMESPACE:-${TMPDIR}ns.ato.default}
export NAMESPACE
export EDITOR=E

export BASH_SILENCE_DEPRECATION_WARNING=1
export PYTHONDONTWRITEBYTECODE=1
export MACH_NO_TERMINAL_FOOTER=1
export MOZ_NOSPAM=1
export DEBIAN_FRONTEND=noninteractive
