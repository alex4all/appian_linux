@echo off
call ..\exports.bat
pushd %AE_SVR%\gateway
%APPIAN_EXEC% gwvalidate %*
popd
