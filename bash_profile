export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

export RUBYOPT="rubygems"
export GEM_PATH="$HOME/.gem/ruby/1.8"
export GEM_HOME="$HOME/.gem/ruby/1.8"

export ARCHFLAGS="-arch x86_64"

export PS1="\[\033[1;34m\]● \[\033[0m\]"

export EDITOR="mate -w"

export CODE="$HOME/Code"

function f () {
  if echo "$1" | grep -q '\.git$'; then
    cd $CODE
    git clone $1
    cd `echo $1 | grep -E -o '([^/]*)$' | sed 's/.git$//'`
  else
    cd $CODE/$1
  fi
}

function _f () {
  local cur replies
  cur="${COMP_WORDS[COMP_CWORD]}"
  replies=$(COLUMNS=1 ls "$CODE")
  COMPREPLY=( $(compgen -W "$replies" -- "$cur") )
  return 0
}

complete -F _f f

export CDPATH=".:~"

export GOROOT=`brew --cellar`/go/HEAD
export GOARCH=amd64
export GOOS=darwin

function wr () {
  open -a "Writeroom" $@
}


# -- start rip config -- #
RIPDIR=/Users/Chris/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
