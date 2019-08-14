# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh

alias .=pwd
alias ..="cd .."

_cd () {
     \cd "$@" &&
     case $- in
     *i*)
          awd
     esac
}
alias cd=_cd

case $(uname) in
Darwin*)
	parent=$(ps -p $PPID -o command=)
	;;
*)
	parent=$(tr -d '\0' </proc/$PPID/cmdline)
	;;
esac

if [[ $parent == "win" ]]
then
	alias ll="ls -Flh"
	alias ls="ls -F | mc"
else
	case $(uname) in
	Darwin)
		alias ll="ls -GFlh"
		alias ls="ls -FG"
		;;
	*)
		alias ll="ls --color -Flh"
		alias ls="ls -F --color"
		;;
	esac
fi
alias l=ls

PS1="% "
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]2;$(whoami)@$(hostname):$(dirs)\007\033]1;\007"'
	echo -en "\x1b[\x36 q"
	;;
*)
	;;
esac
