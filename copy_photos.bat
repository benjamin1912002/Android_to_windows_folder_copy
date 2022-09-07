@echo off
:: Variable creation
set phone_camera=/storage/self/primary/DCIM/Camera
set folder_pc=%USERPROFILE%\Desktop
set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2% 
set adb_path=C:\Users\benja\Downloads\Reload_cellphone\platform-tools
cd %adb_path%

:: Test if folder to save photos exists, if not, creates.
if not exist %folder_pc%\%datetimef% (
	mkdir %folder_pc%\%datetimef%
)

::Copy files in the designated folder, then erase the origin folder from the cellphone. 
adb devices

echo Copiando fotos del celular, dependiendo de la cantidad puede tardar unos minutos...
adb pull %phone_camera% %folder_pc%

echo Fotos copiadas a la PC!.. Eliminando fotos del celular.
adb shell rm -rR %phone_camera%
echo Finalizado! :)
PAUSE