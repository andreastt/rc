set MANPATH /opt/local/share/man:$MANPATH

set -x PATH /usr/local/mysql/bin $PATH
set -x PATH /usr/local/lsws/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /opt/local/bin $PATH
set -x PATH /opt/local/sbin $PATH

set -U BROWSER "open -a Safari"
set -x EDITOR "mate -w"

set fish_color_git_branch yellow
set fish_color_cwd blue
set fish_color_uneditable_cwd red

set PROJECTS "$HOME/Projects"
