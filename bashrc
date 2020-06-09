# TODO: use hostname -f check instead
if systemctl --user show-environment &>/dev/null
then
	export $(systemctl --user show-environment | grep -v ^DISPLAY | xargs)
else
	set -a
	. $HOME/rc/environment
	set +a
fi

alias .=pwd
alias ..="cd .."

alias ll="ls --color -Flh"
alias ls="ls -F --color"
alias l=ls

PROMPT_COMMAND='echo -ne "\033]2;${USER}@${HOSTNAME}:`dirs`\007\033]1;\007"'
PS1="$ENVTOOLKIT_PROMPT\h% "

if [[ "$-" =~ "i" ]]
then
	bind -m vi-insert "\C-l":clear-screen
fi
