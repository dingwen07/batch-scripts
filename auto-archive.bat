@echo off

set AF="Archive"

if [%1]==[] goto run

set fn=%1
IF [%fn:"=%]==[%~n0%~x0] exit
IF [%1]==[%AF%] exit

FOR /F "tokens=1,2 delims=/ " %%i in ("%2") do set yeardate="%%i-%%j"

set y=%date:~0,4%
set /a m=%date:~5,2%
set cym="%y%-%m%"

IF %yeardate%==%cym% exit

IF NOT EXIST .\%AF% MKDIR %AF%
IF NOT EXIST .\%AF%\%yeardate% MKDIR %AF%\%yeardate%

echo %fn:"=%
MOVE /-Y %1 .\%AF%\%yeardate%\%1>NUL


exit

:run
forfiles /C "cmd /c %0 @file @fdate @ftime"
pause