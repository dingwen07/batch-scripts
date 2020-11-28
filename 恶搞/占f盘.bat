@echo off£¬start min
IF EXIST F:\a.txt (help > a.txt)

:a

help >> F:\a.txt

goto a