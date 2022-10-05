@echo off
:: Fill paths accordingly
set phone_camera=/storage/self/primary/DCIM/Camera
set folder_pc=%USERPROFILE%\Desktop
set adb_path=

set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2% 
cd %adb_path%

:: Test if folder to save photos exists, if not, creates.
if not exist %folder_pc%\%datetimef% (
	mkdir %folder_pc%\%datetimef%
)

::Copy files in the designated folder, then erase the origin folder from the cellphone. 
adb devices

echo Copiando fotos del celular, dependiendo de la cantidad puede tardar unos minutos...
adb pull %phone_camera% %folder_pc%\%datetimef%

echo Fotos copiadas a la PC!.. Eliminando fotos del celular.
adb shell rm -rR %phone_camera%
echo Finalizado! :)
PAUSE
