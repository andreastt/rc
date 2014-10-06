setenv GOROOT /usr/local/go
setenv GOPATH $HOME/Code

set path=($path \
          /usr/local/plan9/bin \
          $home/bin \
          $GOPATH/bin \
          $home/Code/moz-git-tools \
          /usr/local/adt/sdk/platform-tools)

setenv EDITOR E
setenv BROWSER FirefoxNightly

#setenv CC clang
#setenv CXX clang++
#setenv CCACHE_PREFIX distcc
setenv CCACHE_DIR $home/.config/ccache
setenv CCACHE_UMASK 002
#setenv DISTCC_HOSTS +zeroconfig

# Selenium test suites will continue running
# even if they reach an error or fail.
setenv haltonerror 0
setenv haltonfailure 0

# I go by a different name on Githoob
setenv GITHUB_USER andreastt

# Language specificness
setenv PYTHONSTARTUP $home/.config/pythonrc.py
setenv PYTHONDONTWRITEBYTECODE 1
setenv MACH_NO_TERMINAL_FOOTER 1

# Mozilla's try server shortcuts
# because these are almost impossible to remember
setenv TRY_ALL "-b do -p all -u all -t none"
setenv TRY_MOBILE "-b do -p emulator,panda -u marionette-webapi -t none"
setenv TRY_DESKTOP "-b linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"

set prompt = "% "
set autolist
set autoexpand
set autocorrect
set complete = enhance
set printexitvalue
set savehist = 10000 merge

bindkey -v
bindkey "^R" i-search-back

alias . "pwd"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ls "ls -G"
alias l "ls | mc"
alias sl ls

