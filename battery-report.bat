@echo off
POWERCFG /BATTERYREPORT /OUTPUT "./batteryreport.html"
START batteryreport.html
ECHO Press any key to delete battery report...
PAUSE>NUL
DEL batteryreport.html
