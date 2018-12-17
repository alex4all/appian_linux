@echo off
title Creating Notifications...
call ..\exports.bat
pushd %AE_SVR%\notifications
%APPIAN_EXEC% n-create
%APPIAN_EXEC% s-create
popd
