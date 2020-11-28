@echo off
cd c:\mailspy\
::��ȡ������
set year=%date:~0,4%
set month=%date:~5,2%
set day=%date:~8,2%

rem ��ʼ������
set batPath=%temp%\SysStatus
set logPath=%temp%\SysStatus\log
set batName=RecordSysStatus.bat
set host=www.baidu.com

::�������
rem cpuʹ����
set /a cpu=0
rem  �����ڴ�����
set memPhysicalTotal=sf
rem  ���������ڴ�
set memAvailable=ds
rem C��ʣ��
set Cfreespace=0
rem C���ܿռ�
set Csize=0
rem ���
set netMin=0ms
rem �
set netMax=0ms
rem ƽ��
set netAva=0ms
rem ����
set processlist=list

::����Ŀ¼�͸����ļ�
if not exist %batPath% md %batPath%
if not exist %logPath% md %logPath%
if not exist %logPath%\%year%-%month% md %logPath%\%year%-%month%
if not exist %batPath%\%batName% copy %~0 %batPath%
if not exist "%batPath%\send.bat" copy "send.bat" %batPath%

set file=%logPath%\%year%-%month%\%year%%month%%day%.txt

::��ȡcpuʹ����
for /f  %%a in ('wmic cpu get LoadPercentage ') do (
if not "%%a"=="LoadPercentage" set /a cpu=%%a 
)

rem ȡ�ڴ�����
for /f "tokens=2"   %%a  in ('systeminfo ^| findstr �����ڴ�����') do (
set memPhysicalTotal=%%a
)
set memPhysicalTotal=%memPhysicalTotal:,=%

for /f "tokens=2"   %%a in ('systeminfo ^| findstr ���õ������ڴ�') do (
set memAvailable=%%a
)
set memAvailable=%memAvailable:,=%

rem ���C��ʣ��ռ�
for /f %%a in ('wmic LogicalDisk where "DeviceID='C:'" get freespace') do (
if  %%a gtr 0  set  Cfreespace=%%a
)

rem ���C���ܿռ�
for /f %%a in ('wmic LogicalDisk where "DeviceID='C:'" get Size') do (
if  %%a gtr 0  set  Csize=%%a
)

rem ��byte��ʾ�������������G��ʾ������
@echo off&setlocal enabledelayedexpansion
call:division %Cfreespace% 1073741824 CGfree 1
call:division %Csize% 1073741824 CGsize 1

rem ����ٷֱ�
call:division %Cfreespace%00 %Csize% CfreePercent 1
call:division %memAvailable%00 %memPhysicalTotal% memAvaiPercent 1


rem �������������ٶȣ�ping host
for /f "tokens=2,4,6 delims=��= " %%a in ('ping %host% ^| findstr �') do (
::echo �����ٶȣ���̣�%%a ���%%bƽ����%%c
set netAva=%%c
set netMax=%%b
set netMin=%%a
)

rem ռ���ڴ泬100M����
setlocal EnableDelayedExpansion    
set processlist=[
for /f "skip=1tokens=2,6" %%a in ('wmic process where  "WorkingSetSize>100090688"  list brief ') do (
set processlist=!processlist!{"Name":"%%a","WorkingSetSize":%%b},
)
set processlist=%processlist%]



rem �������־�ļ�
echo %date:~0,11%%time:~0,8% CPUʹ����:%cpu%%% �����ڴ棺%memAvailable%M �ڴ�������%memPhysicalTotal%M �ڴ�����ʣ�%memAvaiPercent:~1,4%%% C�̿��ã�%CGfree%G C��������%CGsize%G C�̿����ʣ�%CfreePercent%%% ���������ٶȣ���̣�%netMin% ���%netMax% ƽ����%netAva% ��100M���̣�%processlist% >%file%
send.bat
exit



rem �������㣬���÷���Ϊcall:division [����] [������] [��] [��ȷλ��] �磺call:division 12 234 quot 3
:division
setlocal
set str1=%1
set str2=%2
if "%~4" neq "" set u=%4
for %%i in (str1 str2) do if "!%%i:~,1!" == "-" set /a d+=1
if "%d%" == "1" (set d=-) else set "d="
set l=00000000&for /l %%i in (1 1 7) do set "l=!l!!l!"
set "var=4096 2048 1024 512 256 128 64 32 16 8 4 2 1"
for /l %%i in (1 1 2) do (
    set "str%%i=!str%%i:-=!"
    set /a "n=str%%i_2=0"
    for %%a in (!str%%i:.^= !) do (
        set /a n+=1
        set s=s%%a&set str%%i_!n!=0
        for %%b in (%var%) do if "!S:~%%b!" neq "" set/a str%%i_!n!+=%%b&set "S=!S:~%%b!"
        set /a len%%i+=str%%i_!n!
    )
        set str%%i=!str%%i:.=!
)
if !str1_2! gtr !str2_2! (set /a len2+=str1_2-str2_2) else set /a len1+=str2_2-str1_2
for /l %%i in (1 1 2) do (
    set str%%i=!str%%i!!l!
    for %%j in (!len%%i!) do set " str%%i=!str%%i:~,%%j!"
)
for /f "tokens=* delims=0" %%i in ("!str2!") do set s=%%i&set "str2=0%%i"
set len2=1
for %%j in (%var%) do if "!S:~%%j!" neq "" set/a len2+=%%j&set "S=!S:~%%j!"
set /a len=len2+1
if !len1! lss !len2! set len1=!len2!&set "str1=!l:~-%len2%,-%len1%!!str1!"
set /a len1+=u&set str1=0!str1!!l:~,%u%!
set str=!str1:~,%len2%!
set "i=0000000!str2!"&set /a Len_i=Len2+7
for /l %%i in (1 1 9) do (
    set "T=0"
    for /l %%j in (8 8 !Len_i!) do (
        set /a "T=1!i:~-%%j,8!*%%i+T"
        set Num%%i=!T:~-8!!Num%%i!&set /a "T=!T:~,-8!-%%i"
    )
    set Num%%i=!T!!Num%%i!
    set "Num%%i=0000000!Num%%i:~-%Len%!"
)
for /L %%a in (!len2! 1 !Len1!) do (
    set "str=!L!!str!!str1:~%%a,1!"
    set "str=!str:~-%Len%!"
    if "!str!" geq "!str2!" (
       set M=1&set i=0000000!str!
       for /l %%i in (2 1 9) do if "!i!" geq "!Num%%i!" set "M=%%i"
           set sun=!sun!!M!&set str=&set T=0
           for %%i in (!M!) do (
               for /l %%j in (8 8 !Len_i!) do (
                   set /a "T=3!i:~-%%j,8!-1!Num%%i:~-%%j,8!-!T:~,1!%%2"
                   set "str=!T:~1!!str!"
               )
           )
    ) else set sun=!sun!0
)
if defined u if "%u%" gtr "0" set sun=!sun:~,-%u%!.!sun:~-%u%!
endlocal&set %3=%d%%sun%

