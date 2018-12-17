@echo off
setlocal

java -classpath ../classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.ag.namechange.UsernameChangeScript %*
