@echo off
title Creating Process Design...
call ..\exports.bat
pushd %AE_SVR%\process\design
%APPIAN_EXEC% pd-create main
popd
