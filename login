# This combines .cshrc, .login, and .profile.

setenv PLAN9  /usr/local/plan9
setenv GOROOT /usr/local/go
setenv GOPATH $HOME/Code

set path=($path \
          $home/bin \
          $PLAN9/bin \
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
setenv tryall "-b o -p all -u all -t none"
setenv trymobile "-b o -p emulator,panda -u marionette-webapi -t none"
setenv trydesktop "-b o -p linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"
setenv trybasic "-b o -p linux64,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none"

alias . "pwd"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
if (`uname` == "Linux") then
	alias ls "ls --color"
else
	alias ls "ls -G"
endif
alias l "ls | mc"
alias sl ls

if ($?prompt) then
	set prompt = "% "
	set promptchars = "%#"

	set complete = enhance
	set history = 10000
	set savehist = (10000 merge)
	set autolist = ambigeous
	set autoexpand
	set autorehash
	
	if ( $?tcsh ) then
		bindkey "^R" i-search-back
		bindkey "^W" backward-delete-word
	endif
endif
