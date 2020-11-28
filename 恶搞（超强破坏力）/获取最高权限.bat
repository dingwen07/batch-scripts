@echo off
pushd "%temp%"
:cycle
set filename=0
set /p filename=请将批处理文件拖放至此处（退出直接回车）：
if %filename% == 0 exit
echo @pushd "%%temp%%">>part1.txt
echo @echo.^>%%systemroot%%\testfile.tmp>>part1.txt
echo @if exist %%systemroot%%\testfile.tmp goto StartWithAdmin>>part1.txt
echo @echo Set UAC = CreateObject^^^("Shell.Application"^^^)^>getadm.vbs>>part1.txt
echo @echo UAC.ShellExecute "%%~0", "%%*", "", "runas", 1 ^>^>getadm.vbs>>part1.txt
echo @getadm.vbs>>part1.txt
echo @goto :eof>>part1.txt
echo :StartWithAdmin>>part1.txt
echo @del %%systemroot%%\testfile.tmp>>part1.txt
echo @if exist getadm.vbs del getadm.vbs>>part1.txt
echo @pushd "%%~dp0">>part1.txt
echo.>>part1.txt
echo.>>part1.txt
copy %filename% part2.txt
copy /b part1.txt + /b part2.txt /b %filename%
del part1.txt
del part2.txt

