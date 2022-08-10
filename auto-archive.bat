@echo off

SET AF="Archive"

IF [%1]==[] GOTO RUN

ECHO Processing %1...

SET fn=%1
IF ["%fn:"=%"]==["%~n0%~x0"] EXIT
IF [%1]==[%AF%] EXIT

FOR /F "tokens=1,2 delims=/ " %%i in ("%2") do (
    SET year="%%i"
    SET month="%%j"
)
IF %month% LEQ 9 SET month=0%month%
SET yeardate="%year%-%month%"

IF NOT EXIST .\%AF% MKDIR %AF%
IF NOT EXIST .\%AF%\%yeardate% MKDIR %AF%\%yeardate%
IF NOT EXIST .\%AF%\LOG MKDIR %AF%\LOG

SET logfile=.\%AF%\LOG\%yeardate%.log
IF NOT EXIST %logfile% ECHO [%date% %time% %USERNAME%@%COMPUTERNAME%] Log file created.>%logfile%
SET message=ERR

IF EXIST .\%AF%\%yeardate%\%1 GOTO DONE

MOVE /-Y %1 .\%AF%\%yeardate%\%1
SET message=OK

:DONE
ECHO [%date% %time% %USERNAME%@%COMPUTERNAME%] %message%: Move "%fn:"=%" to "%AF:"=%\%yeardate:"=%\%fn:"=%">>%logfile%
ECHO %message%: %fn:"=%

EXIT

:RUN
FORFILES /D -30 /C "cmd /c %0 @file @fdate @ftime"
PAUSE
