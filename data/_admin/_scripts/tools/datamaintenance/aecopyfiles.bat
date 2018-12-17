echo off
call ../../../../server/_scripts/exports.bat
call ../../../../server/_scripts/exports-ant.bat
set INSTALLDIR=%AE_HOME%/_admin/_scripts/tools/datamaintenance/antScripts
echo === DEPRECATED. Please use cleanup.bat ===
ant -f %INSTALLDIR%/aecopyfiles.xml
echo on