@echo off
set /p documents=请拖入您要备份的文件：
md C:\Users\%username%\Documents\backup
copy %documents% C:\Users\%username%\Documents\backup
