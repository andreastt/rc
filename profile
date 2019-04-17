# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh

alias .="pwd"
alias ..="cd .."

# POSIX compatibility -- hah, I laugh in your face!
if [[ $(ps -p $PPID -o comm=) == "win" ]]
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
