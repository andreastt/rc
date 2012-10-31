# Use Emacs Client by default, fall back to new Emacs session
export EDITOR=emacs
export PATH="$PATH:$HOME/bin/"

# Grep
#export GREP_OPTIONS='--exclude-dir=".svn"'

# Compilation
#export CC="ccache clang"
#export CXX="ccache clang++"
#export ICECC_CC="icecc $CC"
#export ICECC_CXX="icecc $CXX"

# Depot Tools
export PATH="$PATH:$HOME/dev/depot_tools"

export GYP_GENERATORS=ninja
export GYP_PARALLEL=1

# IntelliJ
export PATH="$PATH:$HOME/bin/idea-IC-103.255/bin"

# WebC
export PATH="$PATH:$HOME/dev/webc-java/bin"
export WEBC_HOME=/home/ato/dev/webc-java

# Selenium test suites will continue running even if they reach an error or fail
export haltonerror=0
export haltonfailure=0

export SELENIUM_SERVER_JAR=~/selenium-server-standalone-2.25.0.jar

export WATIR_WEBDRIVER_BROWSER=opera

export GITHUB_USER="andreastt"
