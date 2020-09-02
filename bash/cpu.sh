# This is a bash extension that detects when you cd into an sshfs(1)
# mountpoint, then intercepts and relays all shell commands within
# this namespace to the remote using cpu(1).
#
# It relies on a program I wrote called cpu (https://git.sny.no/cmd/cpu)
# to replicate the shell environment in the right subdirectory on the
# remote.
#
# The technique employed here bears many similarities to eshell and
# sshfsexec, but has the advantage of not being tied to a particular
# editor or designated program.

[[ ! -f /usr/local/etc/profile.d/bash-preexec.sh ]] && return
source /usr/local/etc/profile.d/bash-preexec.sh

# Programs that should always be run locally
# and never relayed to the remote:
whitelist=(
	B
	E
	acme.rc
	awd
	bash
	cpu
	du
	file
	logout
	ls
	mkdir
	mv
	pwd
	rm
	rmdir
	ssh
)

_cd () {
	if [ -x "$(command -v awd)" ]
	then
		awd

		\cd "$@" &&
		case $- in
		*i*)
			awd
		esac
	fi

	unset CPU_REMOTE

	local mountp=$(pwd -P | grep -o "$(mount | grep osxfuse | awk '{print $3}')")
	local remote=$(mount | grep osxfuse | grep "$mountp" | awk '{print $1}')
	local cwd=${PWD##$mountp}
	if [[ -n "$mountp" ]]
	then
		export CPU_REMOTE="$remote$cwd"
	fi
}
alias cd=_cd

preexec() {
	[[ ! $CPU_REMOTE_AUTO ]] && return
	[[ -z $CPU_REMOTE ]] && return
	[[ ! -n "$1" ]] && return

	local cmd=$(echo $1 | awk '{print $1}')
	[[ $(type -t "$cmd") =~ ^(alias|builtin)$ ]] && return 0
	[[ ${whitelist[@]} =~ "${cmd}" ]] && return 0

	# causes preexec.sh to abort if this function returns a non-zero value
	shopt -s extdebug
	cpu $1 && return 1 || return $?
}
