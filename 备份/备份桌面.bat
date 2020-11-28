@echo off
set /p disk=请输入您要保存备份文件的磁盘卷标：
md %disk%:\bakup
xcopy c:\Users\%username%\Desktop %disk%:\bakup