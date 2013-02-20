bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\e0c" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\e0d" emacs-backward-word

# C-z resumes program by executing `fg` on command line
bindkey -s "^Z" 'fg\n'
