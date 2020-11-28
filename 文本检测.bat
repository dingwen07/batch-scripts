@ECHO OFF
set /p str=请托入文件	
set /p i=要检查的字符（尽量完整）：
cls
findstr "%i%" "%str%"&&goto 1||goto 0

goto 0

:1
echo 含有“%i%”
pause
exit

:0
cls
echo 没有找到“%i%”
pause
exit