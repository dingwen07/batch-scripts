@echo off
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
set h=%time:~0,2%
set mi=%time:~3,2%
set s=%time:~6,2%
set rdm=_%y%_%m%_%d%_%h%_%mi%_%s%
for /f "delims=" %%a in ('dir /a /b *.exe') do echo;%%~na>>exe%rdm%.txt
dir /ad /b>folder%rdm%.txt
set sum=0
for /f  %%a in (exe%rdm%.txt) do (
findstr "%%a" "folder%rdm%.txt"&&(set /A sum=sum+1&echo."%%a".exe>>detect%rdm%.txt)||echo NOT FOUND
)
cls
if exist "System Volume Information.exe" echo 怀疑该U盘有病毒!&goto clean
if %sum% GEQ 2 goto detected
echo 没有检测到U盘文件夹隐藏病毒
echo.>exe%rdm%.txt
echo.>folder%rdm%.txt
echo.>detect%rdm%.txt
del exe%rdm%.txt>nul
del folder%rdm%.txt>nul
del detect%rdm%.txt>nul
pause
exit
:detected
echo 检测到U盘文件夹隐藏病毒!
if exist "System Volume Information.exe" echo 严重怀疑该U盘有病毒!
:clean
echo 可疑的EXE文件:
type detect%rdm%.txt
echo.
echo 请务必确认这些文件是病毒!
echo 按任意键移动这些EXE文件
pause>nul
mkdir protected%rdm%
attrib +s +h protected%rdm%
for /f %%a in (folder%rdm%.txt) do attrib -s -h %%a
for /f %%a in (folder%rdm%.txt) do move %%a.exe protected%rdm%\
move exe%rdm%.txt protected%rdm%\
move folder%rdm%.txt protected%rdm%\
move detect%rdm%.txt protected%rdm%\
move "System Volume Information.exe " protected%rdm%\
echo %date% %time%>protected%rdm%\time%rdm%.txt
echo @echo off>>view%rdm%.bat
echo explorer.exe protected%rdm%>>view%rdm%.bat
cls
echo 已移动这些病毒到安全的位置，如果需要查看，请运行view%rdm%.bat
pause