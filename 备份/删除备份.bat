@echo off
set /p name=请输入您正在使用的用户名：
set /p documents=请输入您已备份的文件名（包括后缀名）：
del %documents% C:\Users\%name%\Documents\bakup\%documents%
