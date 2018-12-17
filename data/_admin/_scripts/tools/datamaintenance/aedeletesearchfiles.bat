echo off
call ../../../../server/_scripts/exports.bat
call ../../../../server/_scripts/exports-ant.bat
set INSTALLDIR=%AE_HOME%/_admin/_scripts/tools/datamaintenance/antScripts
ant -f %INSTALLDIR%/aedeletesearchfiles.xml
echo on