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
title ���ڳ��������������������ĵȴ�...
set a=C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
for %%a in (%a%) do if exist %%a:\ echo ���ڳ�������%%a:&manage-bde -lock %%a: -ForceDismount >nul 2>nul
title ��������ɣ�
pause
exit