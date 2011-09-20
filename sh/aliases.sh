# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'

alias md='mkdir -p'
alias rd=rmdir

alias d='cd ~/Desktop'
alias h='cd ~/'

alias reload='source ~/.zshrc'

# Super user
alias _='sudo'

# List direcory contents
alias ls='ls -G'
alias la='ls -ah'
alias l='ls -lah'
alias sl=ls

# TODO Alias mate to emacs if mate isn't in path

alias spartoi_terminal="ssh root@$SPARTOI -t 'screen -dr'"
alias spartoi="xtightvncviewer $SPARTOI:1 -passwd /home/andreastt/.vnc/passwd"

alias orgelet="ssh ato@sny.no"
alias orgelet_irc="ssh ato@sny.no -t 'screen -rx -p irc'"
alias orgelet_mail="ssh ato@sny.no -t 'screen -rx -p mail'"
