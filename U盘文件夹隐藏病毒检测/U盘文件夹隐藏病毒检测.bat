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
if exist "System Volume Information.exe" echo ���ɸ�U���в���!&goto clean
if %sum% GEQ 2 goto detected
echo û�м�⵽U���ļ������ز���
echo.>exe%rdm%.txt
echo.>folder%rdm%.txt
echo.>detect%rdm%.txt
del exe%rdm%.txt>nul
del folder%rdm%.txt>nul
del detect%rdm%.txt>nul
pause
exit
:detected
echo ��⵽U���ļ������ز���!
if exist "System Volume Information.exe" echo ���ػ��ɸ�U���в���!
:clean
echo ���ɵ�EXE�ļ�:
type detect%rdm%.txt
echo.
echo �����ȷ����Щ�ļ��ǲ���!
echo ��������ƶ���ЩEXE�ļ�
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
echo ���ƶ���Щ��������ȫ��λ�ã������Ҫ�鿴��������view%rdm%.bat
pause