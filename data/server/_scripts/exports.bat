REM Base of Appian
pushd %~dp0..\..
set AE_HOME=%CD%
popd

REM Common Configuration files for AE
REM These are files common to at least 2 of Java, UI and Arch.
set AE_CONF=%AE_HOME%\conf

REM AE Servers location
set AE_SVR=%AE_HOME%\server
set AE_DOCS=%AE_HOME%\_admin

REM Variables that are used in scripts to refer to server specifics
set AE_SVRBIN=%AE_SVR%\_bin
set AE_SVRCONF=%AE_SVR%\_conf
set AE_SVRLIB=%AE_SVR%\_lib
set AE_SVRLOG=%AE_HOME%\logs
IF NOT EXIST %AE_SVRLOG% mkdir %AE_SVRLOG%
IF NOT EXIST %AE_SVRLOG%\perflogs mkdir %AE_SVRLOG%\perflogs
set AE_SVRSCRIPTS=%AE_SVR%\_scripts

rem Assume 64 bit, and override to 32 bit if needed
set K3HOME=%AE_SVRBIN%\k\win64
IF "%PROCESSOR_ARCHITECTURE%" == "x86" (
  IF NOT DEFINED PROCESSOR_ARCHITEW6432 (
    echo "Detected 32 bit OS."
    set K3HOME=%AE_SVRBIN%\k\win32
  )
)

set APPIAN_EXEC=%K3HOME%\k

REM 1 = view console; 0 = run console in background
set AE_SEE_CONSOLE=1

REM Name of the Appian Engine Monitor Process 
set AE_MONITOR_PROC_NAME=Appian Engine Monitor
