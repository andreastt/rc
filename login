# This combines .cshrc, .login, and .profile.

setenv PLAN9  /usr/local/plan9
setenv GOROOT /usr/local/go
setenv GOPATH $HOME/Code

set path=($path \
          $home/bin \
          $PLAN9/bin \
          $GOPATH/bin \
          $home/Code/git-remote-hg \
          $home/Code/moz-git-tools \
          /usr/local/adt/sdk/platform-tools)
setenv EDITOR E

setenv CCACHE_DIR $home/.config/ccache
setenv CCACHE_UMASK 002
#setenv CCACHE_PREFIX distcc
#setenv DISTCC_HOSTS +zeroconfig

# I go by a different name on Githoob,
# and use custom HGRCPATH to not clutter up $home.
setenv GIT_AUTHOR_EMAIL ato@mozilla.com
setenv GITHUB_USER andreastt
setenv HGRCPATH $home/.config/hgrc

# Other configuration options
setenv PYTHONDONTWRITEBYTECODE 1
setenv MACH_NO_TERMINAL_FOOTER 1
setenv GAIATEST_SKIP_WARNING 1
setenv GECKO_PATH $home/Code/gecko/src
setenv GECKO_OBJDIR $home/Code/gecko/build/b2g

# Selenium test suites will continue running
# even if they reach an error or fail.
setenv haltonerror 0
setenv haltonfailure 0

# Mozilla's try server shortcuts
# because these are almost impossible to remember
setenv tryall "-b o -p all -u all -t none"
setenv trymarionette "-b o -p linux,linux64_gecko -u marionette,marionette-e10s,web-platform-tests-1,marionette-webapi,gaia-ui-test,gaia-integration -t none"

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
alias pyfmt autopep8

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
