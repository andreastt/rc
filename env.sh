export PLAN9=/usr/local/plan9
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$HOME/.cargo/bin
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

export PYTHONDONTWRITEBYTECODE=1
export DEBIAN_FRONTEND=noninteractive
export LESSHISTFILE=/dev/null
