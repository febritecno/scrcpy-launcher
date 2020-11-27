@echo off
SETLOCAL enableDelayedExpansion
rm y
rm n

set /P jawab="masuk mode editing (y/n)?  :  "

if "%jawab%" == "y" ( 
	set /P edit="ingin editing dinyalakan (y/n) : "
	echo SAVED MODE +=> !edit!
	rm mode_editing.txt
	echo !edit! >> mode_editing.txt
)

adb disconnect
adb devices
pause
rm y
rm n