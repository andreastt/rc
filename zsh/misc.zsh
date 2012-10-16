autoload -U url-quote-magic
zle -N self-insert url-quote-magic

bindkey "^[m" copy-prev-shell-word

setopt long_list_jobs

# Emacs compatibility
#setopt No_prompt_cr
#setopt No_prompt_sp

export PAGER=less
export LC_CTYPE=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && \. "$HOME/.pythonbrew/etc/bashrc"
