@echo off
title Creating Process Analytics...
call ..\exports.bat
pushd %AE_SVR%\process\analytics
%APPIAN_EXEC% pa-create main
popd
