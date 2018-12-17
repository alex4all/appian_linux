echo off
call ../../../../../server/_scripts/exports.bat
call ../../../../../server/_scripts/exports-ant.bat
set INSTALLDIR=%AE_HOME%/_admin/_scripts/tools/datamaintenance/antScripts
ant -f %INSTALLDIR%/aecopyfiles.xml -Dae.source.location=%AE_HOME% -Dae.dest.location="c:/ae51_backups" -Dae.datadelete="n" -Dae.copycontents="n" -Dkdb.num="5" -Dkdb.invertselect="y" -Dbatchmode="y"
echo on