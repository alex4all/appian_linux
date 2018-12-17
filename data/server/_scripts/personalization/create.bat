@echo off
title Creating Personalization...
call ..\exports.bat
pushd %AE_SVR%\personalization
%APPIAN_EXEC% ag_create
popd
