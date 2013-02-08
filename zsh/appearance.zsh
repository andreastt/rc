typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[${color}m%}"
    BG[$color]="%{[${color}m%}"
done

# ls colors
autoload colors
colors
#export LSCOLORS="xxfxcxdxbxegedabagacad"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls -G'
fi

setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevarS

# Setup the prompt with pretty colors
setopt prompt_subst

_collapse_pwd() {
        echo $(pwd | perl -pe "s|^$HOME|~|g")
}

#PROMPT='$(_collapse_pwd) $FX[bold]$FG[036]●$FX[reset] '
PROMPT='$(_collapse_pwd) $FX[bold]$FG[036]%%$FX[reset] '

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'
