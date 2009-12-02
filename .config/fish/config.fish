set fish_greeting ""
set -x CLICOLOR 1

set -x PATH /usr/local/sbin /usr/local/bin $PATH /usr/local/mysql/bin ~/.gem/ruby/1.8/bin /usr/local/scala-2.7.6.final/bin/

set MANPATH /opt/local/share/man:$MANPATH

set -x GEM_PATH ~/.gem/ruby/1.8
set -x GEM_HOME ~/.gem/ruby/1.8

set -x ARCHFLAGS "-arch i386 -arch x86_64"

set -U BROWSER "open -a Safari"
set -x EDITOR "mate -w"

set fish_color_git_branch yellow
set fish_color_cwd blue
set fish_color_uneditable_cwd red

set -x RUBYOPT rubygems

set -x PROJECTS "$HOME/Projects"

function parse_git_branch
  sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function fish_prompt --description 'Write out the prompt'
  if test $status = 0
    set status_color (set_color -o $fish_color_cwd)
  else
    set status_color (set_color -o $fish_color_uneditable_cwd)
  end

  # set branch (current_git_branch)
  # printf '%s(%s)%s' (set_color $fish_color_git_branch) $branch (set_color normal)

  printf '%s>%s ' $status_color (set_color normal)
end
