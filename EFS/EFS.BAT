@ECHO OFF

ECHO -----ENCRYPTING-----
CIPHER /E /S:%CD%\
ECHO -----UPDATING CURRENT USER-----
CIPHER /REKEY /S:%CD%\
ECHO -----UPDATING ACCESSORS-----
IF NOT EXIST %CD%\.ACCESSORS MKDIR %CD%\.ACCESSORS
FOR /F "delims==" %%F in ('DIR /b %CD%\.ACCESSORS') do CIPHER /ADDUSER /CERTFILE:"%CD%\.ACCESSORS\%%F" /S:%CD%\

PAUSE
