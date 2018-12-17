@echo off
title Creating Process Execution...
call ..\exports.bat
pushd %AE_SVR%\process\exec
%APPIAN_EXEC% pe-create main
popd
