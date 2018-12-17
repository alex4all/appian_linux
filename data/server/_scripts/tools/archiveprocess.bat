@echo off

call ..\exports.bat
pushd %AE_SVR%\tools

:begin
if not "%1"=="" (
  if "%1"=="-h" goto help
  if "%1"=="-i" goto help
  if "%1"=="-p" goto help
  shift
  goto begin
)

%APPIAN_EXEC% archiveprocess %*
goto end

:help
%APPIAN_EXEC% archiveprocess --help

:end
popd

