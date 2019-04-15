# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh

alias .="pwd"
alias ..="cd .."
alias l="ls -p"

case $(uname) in
Darwin)
	alias ll="ls -Glhp"
	alias ls="ls -G"
	;;
*)
	alias ll="ls --color -lhp"
	alias ls="ls --color"
	;;
esac

PS1="% "
