@echo off
set y=%date:~0,4%
set m=%date:~5,2%
set d=%date:~8,2%
set h=%time:~0,2%
set mi=%time:~3,2%
set s=%time:~6,2%
set folder=%filenamem%_test_%y%_%m%_%d%_%h%_%mi%_%s%
set filename=0
set /p filenamem=�뽫��Python�ű��Ϸ����˴���
if %filenamem% == 0 exit
mkdir %folder%
echo import time>>%folder%\%filenamem%
echo start = time.clock()>>%folder%\%filenamem%
echo.>>%folder%\%filenamem%
type %filenamem%>>%folder%\%filenamem%
echo.>>%folder%\%filenamem%
echo print()>>%folder%\%filenamem%
echo print(time.clock()-start)>>%folder%\%filenamem%
echo subprocess.call("pause",shell=True)
:cycle
set filename=0
set /p filename=�뽫Python�ű��Ϸ����˴������ǲ��ᱻ������ͣ���룺
if %filename% == 0 goto cycle
echo import time>>%folder%\%filenamem%
echo start = time.clock()>>%folder%\%filenamem%
echo.>>%folder%\%filenamem%
type %filenamem%>>%folder%\%filenamem%
echo.>>%folder%\%filenamem%
echo print()>>%folder%\%filenamem%
echo print(time.clock()-start)>>%folder%\%filenamem%
goto cycle