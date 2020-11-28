@echo off
set /p name=请输入您正在使用的用户名：
set /p disk=请输入您存放桌面备份文件的磁盘卷标：
copy %disk%:\bakup c:\Users\%name%\Desktop\
