@echo off
pushd %windir%
if "%1"=="" (echo waiting...)&regedit /s 2.reg&start /max cmd /c "%~0" @&exit
regedit /s 1.reg&popd&shift
color 1f
cls
echo A problem has been detected and windows has been shutdown to prevent damage to your computer.
echo .
echo DRIVER_IRQL_NOT_LESS_OR_EQUAL
echo .
echo If this is the first time бн
echo .
echo If бн continue,press F8 to select advanced startup options, and then select saft mode.
echo .
echo Technical information:
echo .
echo *** stop:0X000000D1(0X00000040,0X00000002,0X00000001,0XF9A5E150)
echo .
pause>nul
