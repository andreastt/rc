# Load libraries

#for lib (~/.sh/*.sh) source $lib
source ~/.sh/env.sh
source ~/.sh/aliases.sh

for lib (~/.zsh/*.zsh) source $lib
unset lib

# prompts
if [[ $TERM == "dumb" ]]; then  # in emacs
    PS1='%(?..[%?])%!:%~%# '
    # for tramp to not hang, need the following. cf:
    # http://www.emacswiki.org/emacs/TrampMode
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
else
    # your prompt stuff
fi
