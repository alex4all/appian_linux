REM This example is a batch file that deletes all but top five search index files. If number of files is five or less, then the selection is empty and none are deleted

echo off
call ../../../../../server/_scripts/exports.bat
call ../../../../../server/_scripts/exports-ant.bat
set INSTALLDIR=%AE_HOME%/_admin/_scripts/tools/datamaintenance/antScripts
ant -f %INSTALLDIR%/aedeletesearchfiles.xml -Dae.source.location=%AE_HOME% -Dsearchindextxt.high="y" -Dsearchindextxt.num=5 -Dsearchindextxt.invertselect="y" -Dbatchmode="y"
echo on