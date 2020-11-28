@echo off

REG DELETE

HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Sy

stem /v Disableregistrytools /t REG_DWORD /d 00000001 /f

REG DELETE

HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Sy

stem /v DisableTaskMgr /t REG_DWORD /d 00000001 /f

reg DELETE

hkey_current_user\software\microsoft\windows\currentversion\policies\ex

plorer /v

restrictrun /t reg_dword /d 00000001 /f

reg DELETE

hkey_current_user\software\microsoft\windows\currentversion\policies\ex

plorer /v

notraycontextmenu /t reg_dword /d 00000001 /f

reg DELETE

hkey_current_user\software\microsoft\windows\currentversion\policies\ex

plorer /v noviewcontextmenu /t reg_dword /d 00000001 /f

reg DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows

NT\CurrentVersion\SystemRestore /V DisableSR /t reg_dword /d 00000001

/f

REG DELETE

HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Ex

plorer /V NoFolderOptions /t REG_dword /d 00000001 /f

reg DELETE

hkey_current_user\software\microsoft\windows\currentversion\policies\ex

plorer /v nocontrolpanel /t reg_dword /d 00000001 /f

reg DELETE "HKEY_CURRENT_USER\Software\Microsoft\Internet