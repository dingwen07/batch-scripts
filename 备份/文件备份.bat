@echo off
set /p documents=��������Ҫ���ݵ��ļ���
md C:\Users\%username%\Documents\backup
copy %documents% C:\Users\%username%\Documents\backup
