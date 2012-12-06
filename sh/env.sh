export EDITOR=vim
export TERMINAL=xterm
export PATH="$PATH:$HOME/dev/depot_tools"

# Plan 9
PLAN9=/home/ato/Downloads/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

# Go
export PATH="$HOME/bin/go/bin:$PATH"
export GOROOT="$HOME/bin/go"

# Compilation
#export CC="ccache clang"
#export CXX="ccache clang++"
#export ICECC_CC="icecc $CC"
#export ICECC_CXX="icecc $CXX"

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
