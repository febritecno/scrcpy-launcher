@echo off
SETLOCAL enableDelayedExpansion

set /P jawab="masuk mode editing (y/n)?"

if "%jawab%" == "y" ( 
	set /P ip="masukan ip android anda (setting->about) : "
	rm mode_editing.txt
	echo SAVED MODE +=> !ip!
	echo !ip! >> mode_editing.txt
)

adb disconnect
adb devices