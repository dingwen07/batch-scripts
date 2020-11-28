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
title 系统工具箱 
COLOR 3f 
MODE con: COLS=33 LINES=19 
set var=0 
 
:start 
set tm1=%time:~0,2% 
set tm2=%time:~3,2% 
set tm3=%time:~6,2% 
echo %date% %tm1%点%tm2%分%tm3%秒 
echo ================================
echo 请选择要进行的操作，然后按回车
echo ────────────────
echo.
echo 1.不显示所有文件和文件夹 
echo 2.显示所有文件和文件夹 
echo 3.隐藏文件夹选项 
echo 4.显示文件夹选项 
echo 5.禁用注册表 
echo 6.解禁注册表 
echo 7.禁用组策略 
echo 8.解禁组策略 
echo 9.禁止运行VBS脚本 
echo 0.允许运行VBS脚本 
echo q.退出 
echo.
if %var% equ 1 echo 第%badenv%个选择无效，请重新输入 
if %var% equ 2 echo 参数过长，请重新输入 
set /p choice=选择： 
set choice1=%choice:~0,1% 
set env=%choice1%2 
goto env 
:choice2 
set choice2=%choice:~1,1% 
if "%choice2%" equ " " goto back 
set env=%choice2%3 
goto env 
:choice3 
set choice3=%choice:~2,1% 
if "%choice3%" equ " " goto back 
set env=%choice3%4 
goto env 
:choice4 
set choice4=%choice:~3,1% 
if "%choice4%" equ " " goto back 
set env=%choice4%5 
goto env 
:choice5 
set choice5=%choice:~4,1% 
if "%choice5%" equ " " goto back 
set env=%choice5%6 
goto env 
:choice6 
set choice6=%choice:~5,1% 
if "%choice6%" equ " " goto back 
set env=%choice6%7 
goto env 
:choice7 
set choice7=%choice:~6,1% 
if "%choice7%" equ " " goto back 
cls 
set var=2 
goto start 
echo. 
:env 
if /i "%env:~0,1%" equ "1" goto hidden 
if /i "%env:~0,1%" equ "2" goto showhidden 
if /i "%env:~0,1%" equ "3" goto nofderoption 
if /i "%env:~0,1%" equ "4" goto folderoption 
if /i "%env:~0,1%" equ "5" goto noregistry 
if /i "%env:~0,1%" equ "6" goto registry 
if /i "%env:~0,1%" equ "7" goto nogpedit 
if /i "%env:~0,1%" equ "8" goto gpedit 
if /i "%env:~0,1%" equ "9" goto novbs 
if /i "%env:~0,1%" equ "0" goto vbs 
if /i "%env:~0,1%" equ "q" goto end 
set /A badenv="%env:~2,1%"-1 
cls 
set var=1 
goto start 
 
:hidden 
:showhidden 
>%temp%\temp.inf echo [Version] 
>>%temp%\temp.inf echo Signature="$Chicago$" 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultInstall] 
>>%temp%\temp.inf echo AddReg=Hidden 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultUnInstall] 
>>%temp%\temp.inf echo AddReg=ShowHidden 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [Hidden] 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","Hidden",65537,2 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","ShowSuperHidden",65537,0 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [ShowHidden] 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","Hidden",65537,1 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","ShowSuperHidden",65537,1 
if /i "%env:~0,1%" equ "1" goto install 
if /i "%env:~0,1%" equ "2" goto uninsta 
 
:nofderoption 
:folderoption 
>%temp%\temp.inf echo [Version] 
>>%temp%\temp.inf echo Signature="$Chicago$" 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultInstall] 
>>%temp%\temp.inf echo AddReg=FolderOption 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultUnInstall] 
>>%temp%\temp.inf echo DelReg=FolderOption 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [FolderOption] 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Policies\Explorer","NoFolderOptions",65537,1 
if /i "%env:~0,1%" equ "3" goto install 
if /i "%env:~0,1%" equ "4" goto uninsta 
 
:noregistry 
:registry 
>%temp%\temp.inf echo [Version] 
>>%temp%\temp.inf echo Signature="$Chicago$" 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultInstall] 
>>%temp%\temp.inf echo AddReg=Registry 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultUnInstall] 
>>%temp%\temp.inf echo DelReg=Registry 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [Registry] 
>>%temp%\temp.inf echo HKCU,"Software\Microsoft\Windows\CurrentVersion\Policies\System","DisableRegistryTools",65537,2 
if /i "%env:~0,1%" equ "5" goto install 
if /i "%env:~0,1%" equ "6" goto uninsta 
 
:nogpedit 
:gpedit 
>%temp%\temp.inf echo [Version] 
>>%temp%\temp.inf echo Signature="$Chicago$" 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultInstall] 
>>%temp%\temp.inf echo AddReg=GpEdit 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultUnInstall] 
>>%temp%\temp.inf echo DelReg=GpEdit 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [GpEdit] 
>>%temp%\temp.inf echo HKCU,"Software\Policies\Microsoft\MMC" 
>>%temp%\temp.inf echo HKCU,"Software\Policies\Microsoft\MMC\{58221C66-EA27-11CF-ADCF-00AA00A80033}" 
>>%temp%\temp.inf echo HKCU,"Software\Policies\Microsoft\MMC\{58221C66-EA27-11CF-ADCF-00AA00A80033}","Restrict_Run",65537,0 
>>%temp%\temp.inf echo HKCU,"Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}" 
>>%temp%\temp.inf echo HKCU,"Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}","Restrict_Run",65537,1 
if /i "%env:~0,1%" equ "7" goto install 
if /i "%env:~0,1%" equ "8" goto uninsta 
 
:novbs 
:vbs 
>%temp%\temp.inf echo [Version] 
>>%temp%\temp.inf echo Signature="$Chicago$" 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultInstall] 
>>%temp%\temp.inf echo DelReg=NoVBS 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [DefaultUnInstall] 
>>%temp%\temp.inf echo AddReg=NoVBS 
>>%temp%\temp.inf echo. 
>>%temp%\temp.inf echo [NoVBS] 
>>%temp%\temp.inf echo HKCR,"VBSFile\Shell\Open" 
>>%temp%\temp.inf echo HKCR,"VBSFile\Shell\Open",,,"&amp;Open" 
>>%temp%\temp.inf echo HKCR,"VBSFile\Shell\Open\Command" 
>>%temp%\temp.inf echo HKCR,"VBSFile\Shell\Open\Command",,0x00020000,"%SystemRoot%\System32\WScript.exe ""%%1"" %%*" 
if /i "%env:~0,1%" equ "9" goto install 
if /i "%env:~0,1%" equ "0" goto uninsta 
 
:install 
rundll32.exe setupapi,InstallHinfSection DefaultInstall 132 %temp%\temp.inf 
del %temp%\temp.inf /q 
For /L %%i in (2,1,7) Do if %env:~2,1% equ %%i goto choice%%i 
 
:uninsta 
rundll32.exe syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %temp%\temp.inf 
del %temp%\temp.inf /q 
For /L %%i in (2,1,7) Do if %env:~2,1% equ %%i goto choice%%i 
 
:back 
cls 
set var=0 
goto start 
 
:end 
exit 
