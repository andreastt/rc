# Use Emacs Client by default, fall back to new Emacs session
export EDITOR=emacs
export PATH="$PATH:$HOME/bin/"

# Grep
export GREP_OPTIONS='--exclude-dir=".svn"'

# Number of concurrent make jobs
export MAKEFLAGS="-j4"

# Set LLVM GCC as the default compiler
export CPP?'llvm-gcc-4.2'
export CC=$CPP
export CXX='llvm-g++'

# IntelliJ
export PATH="$PATH:$HOME/bin/idea-IC-103.255/bin"

# WebC
export PATH="$PATH:$HOME/dev/webc-java/bin"
export WEBC_HOME=/home/ato/dev/webc-java

# Selenium test suites will continue running even if they reach an error or fail
export haltonerror=0
export haltonfailure=0

export SELENIUM_SERVER_JAR=~/bin/selenium-server-standalone-2.15.0.jar

export WATIR_WEBDRIVER_BROWSER=opera

export GITHUB_USER="andreastt"
