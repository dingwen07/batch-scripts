@echo off & setlocal enabledelayedexpansion
cd /d %~dp0 & set PROG=��ȡ���������б�

(echo ��ʾ����^|^|^|^|��������^|^|^|^|����^|^|^|^|״̬^|^|^|^|��������^|^|^|^|��¼Ϊ^|^|^|^|ִ��·��
for /f "tokens=2* delims=:" %%a in ('sc query state^= all ^| findstr "^SERVICE_NAME: \<STATE"') do (
    for %%c in (DISPLAY_NAME,SERVICE_NAME,DESCRIPTION,STATE,START_TYPE,SERVICE_START_NAME,BINARY_PATH_NAME) do if not defined %%c set "%%c=���ޣ�"
    set /a Num+=1
    if !Num! equ 2 (
        echo "%%a" | findstr "RUNNING" >nul && set "STATE=������" || set "STATE=��ֹͣ"
        set Num=0
        echo !DISPLAY_NAME!^|^|^|^|!SERVICE_NAME!^|^|^|^|!DESCRIPTION!^|^|^|^|!STATE!^|^|^|^|!START_TYPE!^|^|^|^|!SERVICE_START_NAME!^|^|^|^|!BINARY_PATH_NAME!
    ) else (
        for /f "tokens=2* delims=:" %%b in ('sc qdescription%%a') do (
            set "DESCRIPTION=%%b"
            set "DESCRIPTION=!DESCRIPTION:~2!"
        )
        for /f "tokens=2* delims==" %%b in ('sc GetDisplayName%%a') do (
            set "DISPLAY_NAME=%%b"
            set "DISPLAY_NAME=!DISPLAY_NAME:~1!"
        )
        for /f "delims=" %%b in ('sc qc%%a ^| findstr "\<START_TYPE \<BINARY_PATH_NAME \<SERVICE_START_NAME"') do (
            set /a Cut+=1
            if !Cut! equ 3 (
                echo "%%b" | findstr /i "LocalService" >nul && set "SERVICE_START_NAME=���ط���" || (
                    echo "%%b" | findstr /i "LocalSystem" >nul && set "SERVICE_START_NAME=����ϵͳ" || (
                        echo "%%b" | findstr /i "NetworkService" >nul && set "SERVICE_START_NAME=�������" || (
                            set "SERVICE_START_NAME=%%b"
                            set "SERVICE_START_NAME=!SERVICE_START_NAME:        SERVICE_START_NAME : =!"
                        )
                    )
                )
                set Cut=0
            ) else (
                if !Cut! equ 2 (
                    set "BINARY_PATH_NAME=%%b"
                    set "BINARY_PATH_NAME=!BINARY_PATH_NAME:        BINARY_PATH_NAME   : =!"
                ) else (
                    echo "%%b" | findstr "DELAYED" >nul && set "START_TYPE=�Զ����ӳ�������" || (
                        echo "%%b" | findstr "AUTO_START" >nul && set "START_TYPE=�Զ�" || (
                            echo "%%b" | findstr "DEMAND_START" >nul && set "START_TYPE=�ֶ�" || set "START_TYPE=����"
                        )
                    )
                )
            )
        )
        set "SERVICE_NAME=%%a"
        set "SERVICE_NAME=!SERVICE_NAME:~1!"
    )
))>service.$


:SortingList
for /f "skip=1 tokens=1 delims=[]" %%a in ('find /n "::SortingListVBS::" "%~0"') do set Line=%%~a
more +%Line% "%~0">Sorting.VBS
(cscript //nologo //e:jscript "Sorting.VBS" < service.$)>"%~dp0service.txt"
del /f/q service.$ Sorting.VBS
exit

::SortingListVBS::
var i = 0, arr = [], max = [];
var reg = /[^\x00-\xff]/g;
 
while(!WSH.StdIn.AtEndOfStream){
    var strLine = WSH.StdIn.ReadLine();
    if(!/^\s*$/.test(strLine)) {
        arr[i] = strLine.split('||');
        for(var j=0; j<arr[i].length; j++) {
            var len = arr[i][j].replace(reg, '..').length;
            if(!max[j] || len > max[j]) max[j] = len;
        }
        i++;
    }
}

for(var i=0; i<arr.length; i++) {
    var s = '';
    for(var j=0; j<arr[i].length; j++) {
        var len = max[j] - arr[i][j].replace(reg, '..').length;
        var space = ' ';
        for (var k=0; k<len; k++) space += ' ';
        s += arr[i][j] + space;
    }
    WScript.Echo(s);
}