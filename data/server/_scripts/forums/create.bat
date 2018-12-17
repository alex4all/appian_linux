@echo off
title Creating Forums...
call ..\exports.bat
pushd %AE_SVR%\forums
%APPIAN_EXEC% afcreate
popd
