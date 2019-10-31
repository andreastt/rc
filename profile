shopt -s extdebug

# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh
. $HOME/src/rc/preexec.sh

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

localwhitelist=(ls pwd ssh cpu)
preexec() {
	[[ -z $CPU_REMOTE ]] && return

	local cmd=$(echo $1 | awk '{print $1}')

	[[ $(type -t "$cmd") =~ ^(alias|builtin)$ ]] && return 0
	[[ ${localwhitelist[@]} =~ ${cmd} ]] && return 0

	# TODO(ato): preexec() doesn't propagate the exit code
	cpu -v $1 && return 1 || return $?
}

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
