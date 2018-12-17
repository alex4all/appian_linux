@echo off
set LICINFO=licinfo.txt
java -classpath %~dp0\classpath.jar com.appiancorp.tools.LicInfo > %LICINFO%
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductId ^| find "ProductId"') do echo -host "%%a" / windows specific machine-id (_m) >> %LICINFO%
echo -cpu %NUMBER_OF_PROCESSORS% >> %LICINFO%
%~dp0\..\..\data-server\engine\bin\q\w64\q >> %LICINFO% 2>&1
start %LICINFO%
