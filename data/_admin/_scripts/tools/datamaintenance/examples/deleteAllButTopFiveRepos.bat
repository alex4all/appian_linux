echo off
call ../../../../../server/_scripts/exports.bat
call ../../../../../server/_scripts/exports-ant.bat
set INSTALLDIR=%AE_HOME%/_admin/_scripts/tools/datamaintenance/antScripts
ant -f %INSTALLDIR%/aedeletefiles.xml -Dae.source.location=%AE_HOME% -Dkdb.high="n" -Dkdb.num="5"  -Dkdb.invertselect="y" -Dbatchmode="y"
echo on