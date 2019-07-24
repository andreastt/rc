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

parent=$(tr -d '\0' </proc/$PPID/cmdline)

# POSIX compatibility -- hah, I laugh in your face!
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

# thin beam cursor in xterm
if [[ $parent != "win" ]]
then
	echo -en "\x1b[\x36 q"
fi
