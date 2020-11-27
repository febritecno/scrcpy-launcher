@echo off
SETLOCAL enableDelayedExpansion
adb shell ip -o a
echo '
echo '
set pilihan=
for /f "delims=" %%x in (mode_editing.txt) do set "pilihan=%%x"
echo EDITING MODE : %pilihan%
set content=
for /f "delims=" %%x in (ip_device.txt) do set "content=%%x"
echo IP DEVICE SAVED : %content%

2>NUL CALL :CASE_%pilihan%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

ECHO Done.
EXIT /B

:CASE_y
	echo '
	echo '
	echo SAVED IP => %content%
	echo apakah ingin mengubah ip_device yg tersimpan ?
	set /P jawab="Ubah IP ? (y/n) : "

	if "%jawab%" == "y" (
	set /P ip="Masukan IP Ponsel: " 
	rm ip_device.txt
	rm !content!
	echo SAVE IP DEVICE +=> !ip!
	echo !ip! >> ip_device.txt
	)
	adb tcpip 5555
	adb connect %content%
	adb devices
	scrcpy.exe --turn-screen-off --always-on-top --render-expired-frames
	pause
  GOTO END_CASE
:CASE_n
	adb devices
	echo Menjalankan mirror server......
	scrcpy.exe --turn-screen-off --always-on-top --render-expired-frames
  GOTO END_CASE
:DEFAULT_CASE
  ECHO Unknown.
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL

rm !content!