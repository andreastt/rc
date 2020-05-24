export PLAN9=/usr/local/plan9
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$GOBIN

TMPDIR=${TMPDIR:-/tmp/}
NAMESPACE=${NAMESPACE:-${TMPDIR}ns.ato.default}
export NAMESPACE
if [[ -n $SSH_CLIENT ]]
then
	export EDITOR=vis
else
	export EDITOR=E
fi

export XDG_CONFIG_HOME=$HOME/rc
export XDG_CACHE_HOME=$HOME/tmp

export PYTHONDONTWRITEBYTECODE=1
export DEBIAN_FRONTEND=noninteractive
export HISTFILE="$XDG_CACHE_HOME"/bash/history
export LESSHISTFILE=/dev/null
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
