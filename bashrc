# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias ls="ls --color"
alias v="/usr/bin/vim"
alias orgelet="ssh ato@e-tjenesten.org -t screen -dr"

# some paths i need acces to quickly
alias devru="cd /var/www/devru/"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

PS1='\j \[\e[1;30m\]\u\[\e[m\]@\[\e[1;34m\]\h\[\e[m:\e[1;33m\]\w\[\e[m\]\$ '

#export CC=ccache gcc
export CC=gcc
export CVS_RSH=ssh
export EDITOR=vim

# swap two filenames around
swap ()
{
   if [ $# -ne 2 ]; then
      echo "swap: 2 arguments needed"; return 1
   fi

   if [ ! -e $1 ]; then
      echo "swap: $1 does not exist"; return 1
   fi

   if [ ! -e $2 ]; then
      echo "swap: $2 does not exist"; return 1
   fi

   local TMPFILE=tmp.$$ ; mv $1 $TMPFILE ; mv $2 $1 ; mv $TMPFILE $2
}

# For some reason, rot13 pops up everywhere
rot13 ()
{
   if [ $# -eq 0 ]; then
      tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
   else
      echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
   fi
}
