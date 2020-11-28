@pushd "%temp%"
@echo.>%systemroot%\testfile.tmp
@if exist %systemroot%\testfile.tmp goto StartWithAdmin
@echo Set UAC = CreateObject^("Shell.Application"^)>getadm.vbs
@echo UAC.ShellExecute "%~0", "%*", "", "runas", 1 >>getadm.vbs
@getadm.vbs
@goto :eof
:StartWithAdmin
@del %systemroot%\testfile.tmp
@if exist getadm.vbs del getadm.vbs
@pushd "%~dp0"


@echo off
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
set fpath="EventLogExport_%y%_%m%_%d%"
mkdir %fpath% 2>nul

wevtutil export-log query.xml %fpath%\out.evtx /structuredquery:true /overwrite
