@echo off
call ..\exports.bat
%APPIAN_EXEC% %AE_SVRLIB%\convert_l_to_text %1
