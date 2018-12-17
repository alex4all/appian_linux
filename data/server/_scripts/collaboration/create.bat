@echo off
title Creating Collaboration...
call ..\exports.bat
pushd %AE_SVR%\collaboration
%APPIAN_EXEC% dcinit
%APPIAN_EXEC% statinit
popd
