@echo off
title Creating Channels...
call ..\exports.bat
pushd %AE_SVR%\channels
%APPIAN_EXEC% channels-create
popd
