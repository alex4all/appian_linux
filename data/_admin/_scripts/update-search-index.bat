@echo off
setlocal

set TIMESTAMP_FILE=.search-timestamp

set ARG1=
if NOT %1/==-new/ if NOT %1/==-update/ set ARG1=%1

set FLAG=%1
if NOT %FLAG%/==-new/ set FLAG=-update

java -classpath classpath.jar -Dlog4j.defaultInitOverride=true com.appiancorp.search.export.ExportDriver %FLAG% %TIMESTAMP_FILE% %ARG1% %2 %3 %4 %5 %6 %7 %8