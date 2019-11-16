# This is a bash extension that detects when you cd into an sshfs(1)
# mountpoint, then intercepts and relays all shell commands within
# this namespace to the remote.
#
# It relies on a program I wrote called cpu (https://git.sny.no/cmd/cpu)
# to replicate the shell environment in the right subdirectory on the
# remote.
#
# The technique employed here bears many similarities to eshell and
# sshfsexec, but has the advantage of not being tied to a particular
# editor or designated program.

# Programs that should always be run locally
# and never relayed to the remote:
whitelist=(
	ls
	rm
	mv
	du
	file
	pwd
	ssh
	cpu
	bash
	acme.rc
	B
	E
	awd
)

. $HOME/src/rc/preexec.bash

_cd () {
	\cd "$@" &&
	case $- in
	*i*)
		awd
	esac

	unset CPU_REMOTE

	local mountp="$(mount | grep osxfuse | awk '{print $3}')"
	local remotep="$(mount | grep osxfuse | awk '{print $1}')"
	if [[ -n "$mountp" ]] && [[ "$(pwd)" = "$mountp"* ]]
	then
		local pwd=$(pwd)
		local relp=${pwd#$mountp}
		export CPU_REMOTE="$remotep$relp"
	fi
}
alias cd=_cd

preexec() {
	[[ -z $CPU_REMOTE ]] && return
	[[ ! -n "$1" ]] && return

	local cmd=$(echo $1 | awk '{print $1}')
	[[ $(type -t "$cmd") =~ ^(alias|builtin)$ ]] && return 0
	[[ ${whitelist[@]} =~ "${cmd}" ]] && return 0

	# TODO(ato): preexec() doesn't propagate the exit code
	cpu $1 && return 1 || return $?
}
