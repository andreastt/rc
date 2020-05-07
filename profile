set -o functrace >/dev/null 2>&1
shopt -s extdebug >/dev/null 2>&1

. $HOME/rc/env.sh
. $HOME/rc/cpu.bash

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

PS1="% "
