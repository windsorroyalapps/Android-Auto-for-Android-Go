#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

app_path="$0"

# Need this for daisy-chained symlinks.
while
    APP_HOME=${app_path%"${app_path##*/}"}
    [ -h "$app_path" ]
do
    ls=$( ls -ld "$app_path" )
    link=${ls#*' -> '}
    case $link in
    /*) app_path=$link ;;
    *) app_path=$APP_HOME$link ;;
    esac
done

APP_HOME=$( cd "${APP_HOME-.}" && pwd -P ) || exit

APP_JAR=$(find "$APP_HOME" -name 'gradle-wrapper.jar' | head -1)
if [ -z "$APP_JAR" ]; then
    echo 'Error: gradle-wrapper.jar not found'
    exit 1
fi

exec java $JAVA_OPTS -jar "$APP_JAR" "$@"