@echo off
title ����ʱ
COLOR 21
set /p num=ʱ�䣨�룩��
set /p program=ִ�еĳ���
cls
for /L %%a in ( 
%num%,-1,0
) do ( 
echo 				����ʱʣ�� %%a �� 
echo 			    ����ʱ��ɺ�������%program%��
ping -n 2 localhost 1>nul 2>nul 
cls
)
start %program%
