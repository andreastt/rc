set -o functrace >/dev/null 2>&1
shopt -s extdebug >/dev/null 2>&1

. $HOME/src/rc/env.sh
. $HOME/src/rc/cpu.bash

alias .=pwd
alias ..="cd .."

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
