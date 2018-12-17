@echo off

pushd .
call ..\exports.bat
cd %AE_SVR%\tools

:begin
if not "%1"=="" (
  if "%1"=="-h" goto help
  if "%1"=="-i" goto help
  if "%1"=="-p" goto help
  shift
  goto begin
)

%APPIAN_EXEC% sizing %*
goto end

:help
%APPIAN_EXEC% sizing help

:end
popd

