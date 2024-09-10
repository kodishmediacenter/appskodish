@Echo Off
mode con: cols=80 lines=5
chcp 65001 >nul
title Restaurar local padrão da biblioteca do usuário by @DuanyDias
chcp 850 >nul
(net session >nul 2>&1)&&(cd /d "%~dp0")||(powershell start '%~0' -verb RunAs & exit /b)
chcp 65001 >nul
setlocal enabledelayedexpansion
set "ltrdrive="
cls
chcp 65001 >nul
mode con: cols=85 lines=5
echo.
echo.
echo     Selecione a partição onde foi salva a biblioteca do usuário. . .
set "twindow="
set "twdescr=Selecione a partição onde foi salva a biblioteca do usuário."
set "twindow="(new-object -COM 'Shell.Application').BrowseforFolder(0,'%twdescr%',0x200,0).self.path""
chcp 850 >nul
for /f "usebackq delims=\" %%p in (`powershell %twindow%`) do set ltrdrive=%%p
chcp 65001 >nul
if "%ltrdrive%"=="" Exit
cls
mode con: cols=80 lines=5
set "srcUser=%ltrdrive%\%USERNAME%"
set "dstUser=%USERPROFILE%"
if not exist "%srcUser%" goto nFLibUsr
cls & echo. & echo. & echo     Restaurando registro do local padrão da biblioteca. . .
timeout /t 3 /nobreak >nul
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" >nul 2>&1
if "%ERRORLEVEL%"=="0" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\3D Objects" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Desktop" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Favorites" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Music" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Pictures" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Videos" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Documents" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Downloads" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Pictures" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Videos" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Contacts" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF786}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Documents" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Downloads" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Saved Games" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Links" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Music" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A52BBA46-E9E1-435F-B3D9-28DAA648C0F6}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\OneDrive" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\Searches" /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HideFirstRunExperience /t REG_DWORD /d 1 /f >nul
timeout /t 2 /nobreak >nul
cls
chcp 850 >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { $srcUser = '%srcUser%'; $dstUser = '%dstUser%'; $srcUser = $srcUser.Trim(); $dstUser = $dstUser.Trim(); $folders = @('3D Objects', 'Contacts', 'Desktop', 'Documents', 'Downloads', 'Favorites', 'Links', 'Music', 'OneDrive', 'Pictures', 'Saved Games', 'Searches', 'Videos'); foreach ($folder in $folders) { $srcfPath = Join-Path $srcUser $folder; $destPath = Join-Path $dstUser $folder; if (Test-Path $srcfPath) { Write-Host ''; Write-Host ''; Write-Host ('     Movendo a pasta """' + $folder + '""" para """' + $destPath + '""". . .'); robocopy $srcfPath $destPath /E /COPYALL /SJ /NFL /NDL >$null 2>&1; Start-Sleep -Seconds 2; Remove-Item -Path $srcfPath -Recurse -Force -ErrorAction SilentlyContinue; Clear-Host; } } }"
cls
chcp 65001 >nul
echo.
echo.
echo     Ajustando pontos de junção e atributos. . .
timeout /t 2 /nobreak >nul
if exist "%srcUser%\Desktop" rd /Q /S "%srcUser%\Desktop" >nul 2>&1
if exist "%srcUser%\Documents" rd /Q /S "%srcUser%\Documents" >nul 2>&1
if exist "%srcUser%\Downloads" rd /Q /S "%srcUser%\Downloads" >nul 2>&1
for /f "tokens=1-4* delims= " %%i in ('dir /AL "%dstUser%\Documents" ^| findstr "["') do (
   set "jpoints=%%l %%m"
   for /f "tokens=1,2 delims=[" %%i in ("!jpoints!") do (
      set "jLNme=%%i"
      set "fpath=%%j"
      for /l %%a in (1,1,10) do if "!jLNme:~-1!"==" " set "jLNme=!jLNme:~0,-1!"
      set "fpath=!fpath:]=!"
	  for %%f in ("!fpath!") do set "fldrNm=%%~nxf"
	  attrib -s -h -i "%dstUser%\Documents\!jLNme!" /L >nul 2>&1
	  timeout /t 1 /nobreak >nul
	  rd /q "%dstUser%\Documents\!jLNme!" >nul 2>&1
	  timeout /t 1 /nobreak >nul
	  mklink /J "%dstUser%\Documents\!jLNme!" "%dstUser%\!fldrNm!" >nul 2>&1
	  timeout /t 1 /nobreak >nul
	  attrib +s +h +i "%dstUser%\Documents\!jLNme!" /L >nul 2>&1
   )
)
start explorer.exe
timeout /t 3 /nobreak >nul
cls & echo. & echo. & echo     Concluído & timeout /t 5 /nobreak >nul
start "" "https://cutt.ly/Swh2uy0b"
start "" "https://www.youtube.com/@xerifetech?sub_confirmation=1"
explorer "%dstUser%"
Exit

:nFLibUsr
cls
echo.
echo.
echo     Não existe a pasta "%USERNAME%" em "%ltrdrive%\".
timeout /t 5 /nobreak >nul
Exit
