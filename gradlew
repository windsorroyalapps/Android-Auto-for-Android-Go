#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a symlink
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED_PWD=`pwd`
cd "`dirname \"$PRG\"`/.."
APP_HOME=`pwd -P`
cd "$SAVED_PWD"

APP_JAR=$APP_HOME/gradle/wrapper/gradle-wrapper.jar
if [ ! -f "$APP_JAR" ]; then
    echo "Error: gradle-wrapper.jar not found. Re-downloading..."
    mkdir -p "$APP_HOME/gradle/wrapper"
    cd "$APP_HOME/gradle/wrapper"
    curl -L -o gradle-wrapper.jar https://services.gradle.org/distributions/gradle-8.5-bin.zip
    unzip -q gradle-8.5-bin.zip
    rm gradle-8.5-bin.zip
    cd "$SAVED_PWD"
fi

JAVA_OPTS="${JAVA_OPTS} -Xmx2048m"

exec java $JAVA_OPTS -jar $APP_JAR "$@"