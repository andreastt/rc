# Use Emacs Client by default, fall back to new Emacs session
export EDITOR=e
export PATH="$PATH:$HOME/bin/"

# Grep
export GREP_OPTIONS='--exclude-dir=".svn"'

# Number of concurrent make jobs
export MAKEFLAGS="-j4"

# IntelliJ
export PATH="$PATH:$HOME/bin/idea-IC-103.255/bin"

# WebC
export PATH="$PATH:$HOME/dev/webc-java/bin"
export WEBC_HOME=/home/ato/dev/webc-java

# Java related (don't need this if using OpenJDK)
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.@text=true"  # Antialiasing for fonts in Java

# Selenium test suites will continue running even if they reach an error or fail
export haltonerror=0
export haltonfailure=0

#export OPERA_PATH=/home/andreastt/gogilauncher/builds/opera-core-integration-202-buildsetid_37059-core_2_10-lingogi/profiles/release_desktop/lingogi_release_desktop
#export OPERA_PATH=/home/andreastt/gogilauncher/builds/opera-core-integration-205-buildsetid_37524-core_2_9-lingogi/profiles/release_desktop/lingogi_release_desktop
#export OPERA_PATH=/home/andreastt/gogilauncher/builds/opera-core-integration-208-buildsetid_37730-core_2_10-lingogi/profiles/release_desktop/lingogi_release_desktop
#export OPERA_PATH=/home/ato/gogi/opera-core-integration-236-buildsetid_39669-core_2_11-lingogi64/profiles/release_desktop/lingogi_release_desktop

#export OPERA_PATH=/home/andreastt/gogi/opera-core-integration-245-buildsetid_40535-core_2_11-lingogi/profiles/release_desktop/lingogi_release_desktop
#export OPERA_PATH=/home/andreastt/gogi/opera-core-integration-260-buildsetid_41775-core_2_11-lingogi/profiles/release_desktop/lingogi_release_desktop
export OPERA_PATH=/home/andreastt/gogi/opera-core-integration-268-buildsetid_42563-core_2_11-lingogi/profiles/release_desktop/lingogi_release_desktop

export SELENIUM_SERVER_JAR=~/bin/selenium-server-standalone-2.15.0.jar
#export SELENIUM_SERVER_JAR=/home/andreastt/dev/selenium/build/java/server/src/org/openqa/grid/selenium/selenium-standalone.jar

export WATIR_WEBDRIVER_BROWSER=opera

export SPARTOI='10.20.28.228'

export GITHUB_USER="andreastt"
