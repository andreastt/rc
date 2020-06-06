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
if [[ -n $SSH_CLIENT ]]
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

bind -m vi-insert "\C-l":clear-screen

cwd_to_urxvt() {
	local update="\0033]777;cwd-spawn;path;$PWD\0007"
	case $TERM in
	screen*)
		# pass through to parent terminal emulator
		update="\0033P$update\0033\\";;
	esac
	echo -ne "$update"
}

cwd_to_urxvt # execute upon startup to set initial directory

ssh_connection_to_urxvt() {
	# don't propagate information to urxvt if ssh is used non-interactive
	[ -t 0 ] || [ -t 1 ] || return
	local update="\0033]777;cwd-spawn;ssh;$1\0007"
	case $TERM in
	screen*)
		# pass through to parent terminal emulator
		update="\0033P$update\0033\\";;
	esac
	echo -ne "$update"
}
