# non-login shells do not source /etc/profile.d/*
. $HOME/src/rc/env.sh

#shopt -s extdebug

preexec_invoke_exec () {
	#echo "comp line: $COMP_LINE"
	#echo "PROMPT_COMMAND=$PROMPT_COMMAND"
	#echo "BASH_COMMAND=$BASH_COMMAND"
	#echo "BASH_ARGV0=$BASH_ARGV0"
	#echo "BASH_ARGC=$BASH_ARGC"
	#echo "BASH_ARGV=$BASH_ARGV"
	#echo "BASH_EXECUTION_STRING=$BASH_EXECUTION_STRING"
	#echo "BASH_SOURCE=$BASH_SOURCE"
	#echo "HISTCMD=$HISTCMD"
	#echo "ENV=$ENV"
	#echo "FUNCNAME=$FUNCNAME"
	#echo "FUNCNEST=$FUNCNEST"

	# do nothing on completion
	[ -n "$COMP_LINE" ] && return

	# skip local roots
	[[ "$PWD" != /u* ]] && return

	# skip bash builtins called implicitly
        local this_command=$(HISTTIMEFORMAT= history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//")
	[[ "$this_command" != "$BASH_COMMAND" ]] && return

	# skip certain whitelisted commands
	# that can be run locally
	local first=$(echo $BASH_COMMAND | cut -f 1 -d " ")
	case "$first" in
	cd|clear|pwd|ls|file|l|ll|.|..)
		return
		;;
	*)
		#sshfsexec2 $BASH_COMMAND
		exec ssh -t tristan $BASH_COMMAND
		;;
	esac

	return 1
}
#trap preexec_invoke_exec DEBUG

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
