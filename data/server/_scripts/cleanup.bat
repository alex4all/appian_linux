@echo off
setlocal
call exports.bat
call exports-ant.bat
pushd ant

set ca=0
set ck=0
set cl=0
set d=0
set keep=0
set bkuppath=""

if "!%1"=="!" goto help
if "!%1"=="!" goto end
if "%1"=="-?" goto help
if "%1"=="-h" goto help
if "%1"=="-help" goto help
if "%1"=="--help" goto help
if "%1"=="processes" set ca=1
if "%1"=="data" set ck=1
if "%1"=="logs" set cl=1

:getargs
shift
if "!%1"=="!" goto default
if "%1"=="-target" set bkuppath=%2
if "%1"=="-keep" set keep=%2
if "%1"=="-delete" set d=1
goto getargs

:default
if %ck%==1 goto kdb
if %ca%==1 goto ap
if %cl%==1 goto log
goto help

:log
if not %d%==1 call ant -f logs.xml -Ddir="%AE_SVRLOG%" -Dlog.numkeep="%keep%" -Dlog.bkupdir="%bkuppath%"
if %d%==1  call ant -f logs.xml -Ddir="%AE_SVRLOG%"  -Dlog.numkeep="%keep%" -Dlog.del="y" 
goto end

:ap
if not %d%==1 call ant -f ap.xml -Dap.xmldir="%AE_SVRCONF%" -Dsvr.root="%AE_SVR%" -Dap.del="n" -Dap.daystokeep="%keep%" -Dap.bkupdir="%bkuppath%"
if %d%==1 call ant -f ap.xml -Dap.xmldir="%AE_SVRCONF%" -Dsvr.root="%AE_SVR%" -Dap.del="y"  -Dap.daystokeep="%keep%"
goto end

:kdb
if not %d%==1 call ant -f aemovefiles.xml -Dae.source.location="%AE_HOME%"  -Dbatchmode="y" -Dkdb.invertselect="y" -Dae.copycontents="n" -Dkdb.num="%keep%" -Dkdb.bkupdir="%bkuppath%"
if %d%==1 call ant -f aedeletefiles.xml -Dae.source.location="%AE_HOME%" -Dbatchmode="y" -Dkdb.invertselect="y"  -Dkdb.num="%keep%"
goto end


REM ============================================
REM HELP AND ERROR MESSAGES
REM ============================================

REM ===================
REM HELP
:help
echo Usage: cleanup [action] [options] [arguments]
echo.
echo Description: run this script periodically to clean up old items on disk to preserve free space.  
echo The script either moves or deletes old log files, process archives, and data files based on 
echo the options specified in the parameters.
echo.
echo Actions:
echo.
echo   logs: cleans up old log files
echo   data: cleans up old data files
echo   processes: cleans up old archived processes
echo   help: displays this screen
echo.
echo Options:
echo.
echo   -target: specify the full or relative path to back up cleaned-up files to.
echo.
echo   -keep: specify the number of existing files to keep. For data files and log files, provide an integer specifying the number of files to keep. For process archives, provide an integer specifying the number of days of archives to keep.
echo.
echo   -delete: specify if files should be deleted instead of moved.
echo.
echo Examples:
echo.
echo  cleanup processes -target C:\BKUP20\ap\ -keep 100
echo  Will move archived process files older than 100 days to C:\BKUP20\ap\
echo.
echo  cleanup data -delete -keep 10
echo  Will keep the 10 most recent data files and delete older ones
echo.
echo  cleanup logs -target C:\BKUP20\logs\ -keep 3
echo  Will keep the 3 most recent log files of each type and move all others to C:\BKUP20\logs\
goto end

:end
popd