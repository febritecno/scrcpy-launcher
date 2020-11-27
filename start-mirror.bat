@echo off
SETLOCAL enableDelayedExpansion
adb devices

set pilihan=
for /f "delims=" %%x in (mode_editing.txt) do set "pilihan=%%x"
echo EDITING MODE : %pilihan%
set content=
for /f "delims=" %%x in (id_device.txt) do set "content=%%x"
echo ID DEVICE SAVED : %content%

2>NUL CALL :CASE_%pilihan%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

ECHO Done.
EXIT /B

:CASE_y
	echo [ untuk mengubah mode edit dan langsung, ganti y/n pada file mode_editing.txt]
	echo masukan id_devices di paling atas untuk ubah data(id_device.text)
	echo apakah ingin mengubah id_device yg tersimpan ?
	set /P jawab="Ubah ID DEVICE ? (y/n) : "

	if "%jawab%" == "y" (
	set /P id="Masukan ID Devices: " 
	rm id_device.txt
	echo SAVE ID DEVICE +=> !id!
	echo !id! >> id_device.txt
	)
	echo Menjalankan mirror......
	scrcpy.exe -s %content% --turn-screen-off --always-on-top --render-expired-frames
	pause
  GOTO END_CASE
:CASE_n
	echo Menjalankan mirror......
	scrcpy.exe -s %content% --turn-screen-off --always-on-top --render-expired-frames
	pause
  GOTO END_CASE
:DEFAULT_CASE
  ECHO Unknown.
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL