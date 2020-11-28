@echo off£¬start min
IF EXIST D:\a.txt (help > a.txt)

:a

help >> D:\a.txt

goto a