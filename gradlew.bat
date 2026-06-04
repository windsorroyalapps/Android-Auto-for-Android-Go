@echo off
setlocal

set APP_HOME=%~dp0
set APP_JAR=%APP_HOME%gradle\wrapper\gradle-wrapper.jar

if not exist "%APP_JAR%" (
    echo Error: gradle-wrapper.jar not found. Re-downloading...
    mkdir "%APP_HOME%gradle\wrapper"
    powershell -Command "Invoke-WebRequest -Uri https://services.gradle.org/distributions/gradle-8.5-bin.zip -OutFile %APP_HOME%gradle\wrapper\gradle-8.5-bin.zip"
    powershell -Command "Expand-Archive -Path %APP_HOME%gradle\wrapper\gradle-8.5-bin.zip -DestinationPath %APP_HOME%gradle\wrapper\
    del %APP_HOME%gradle\wrapper\gradle-8.5-bin.zip
)

set JAVA_OPTS=%JAVA_OPTS% -Xmx2048m

java %JAVA_OPTS% -jar %APP_JAR% %*