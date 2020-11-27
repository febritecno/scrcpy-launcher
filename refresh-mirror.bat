@echo off
SETLOCAL enableDelayedExpansion

set pilihan=
for /f "delims=" %%x in (mode_editing.txt) do set "pilihan=%%x"
echo EDITING MODE : %pilihan%

rm %pilihan%

set /P jawab="masuk mode editing (y/n)?  :  "

if "%jawab%" == "y" ( 
	set /P edit="ingin editing dinyalakan (y/n) : "
	echo SAVED MODE +=> !edit!
	rm mode_editing.txt
	echo !edit! >> mode_editing.txt
)

adb disconnect
adb devices
rm %pilihan%
pause