@echo off
title Creating Portal...
call ..\exports.bat
pushd %AE_SVR%\portal
%APPIAN_EXEC% ap-create
popd
