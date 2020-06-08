#. $HOME/rc/profile
#. $HOME/rc/cpu.bash

export PLAN9=/usr/local/plan9
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH=$HOME/bin:$PATH
export PATH=$PATH:$PLAN9/bin
export PATH=$PATH:$GOBIN

TMPDIR=${TMPDIR:-/tmp/}
NAMESPACE=${NAMESPACE:-${TMPDIR}ns.ato.default}
export NAMESPACE
if [[ -n $SSH_CLIENT || $(hostname) == "kain" ]]
then
	export EDITOR=vis
else
	export EDITOR=E
fi

export XDG_CACHE_HOME=$HOME/tmp
export XDG_CONFIG_HOME=$HOME/rc
export XDG_DATA_HOME=$HOME/lib

export DEBIAN_FRONTEND=noninteractive
export HISTFILE="$XDG_CACHE_HOME"/bash/history
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export LESSHISTFILE=/dev/null
export PYTHONDONTWRITEBYTECODE=1
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export XAPPLRESDIR=$XDG_CONFIG_HOME/x

alias .=pwd
alias ..="cd .."

if [[ $(tr -d '\0' </proc/$PPID/cmdline) == "win" ]]
then
	alias ll="ls -Flh"
	alias ls="ls -F | mc"
else
	alias ll="ls --color -Flh"
	alias ls="ls -F --color"
fi
alias l=ls

PROMPT_COMMAND='echo -ne "\033]2;${USER}@${HOSTNAME}:`dirs`\007\033]1;\007"'
PS1="$ENVTOOLKIT_PROMPT\h% "

if [[ "$-" =~ "i" ]]
then
	export TERM=xterm-256color
	bind -m vi-insert "\C-l":clear-screen
fi
