@echo off
setlocal
set JAVA_CMD=java
if defined JAVA_HOME (
  set JAVA_CMD="%JAVA_HOME%\bin\java"
)

pushd ..\..\deployment\web.war
%JAVA_CMD% -classpath %~dp0classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.common.initialize.InitializeServer WEB-INF\conf\dataload\config.xml
popd
