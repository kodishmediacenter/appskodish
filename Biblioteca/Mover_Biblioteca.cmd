@Echo Off
mode con: cols=78 lines=8
chcp 65001 >nul
title Mover biblioteca do usuário by @DuanyDias
chcp 850 >nul
(net session >nul 2>&1)&&(cd /d "%~dp0")||(powershell start '%~0' -verb RunAs & exit /b)
chcp 65001 >nul
setlocal enabledelayedexpansion
set "ltrdrive="
for /f "tokens=6 delims=[]. " %%b in ('ver') do set winbld=%%b

:startcpt
cls
mode con: cols=78 lines=10
echo.
echo     ╔═══════════════════════════════════════════════════════════════════╗
echo      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo      ░ POR PADRÃO A PARTIÇÃO DO WINDOWS É REDUZIDA PARA CRIAR UMA NOVA ░
echo      ░ PARTIÇÃO A QUAL RECEBERÁ AS PASTAS DA BIBLIOTECA DO USUÁRIO.    ░
echo      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo     ╚═══════════════════════════════════════════════════════════════════╝
echo.
choice /n /c SN /m "-   > Deseja selecionar outra partição com espaço disponível? (S ou N): "
if errorlevel 2 goto atszpart
if errorlevel 1 goto selpart

:atszpart
cls
mode con: cols=78 lines=8
set "pminimum="
set "calspart="
echo.
echo     ╔═══════════════════════════════════════════════════════════════════╗
echo      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo      ░  DEFINA UM TAMANHO PARA A PARTIÇÃO EM "GB" E PRESSIONE "ENTER"  ░
echo      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo     ╚═══════════════════════════════════════════════════════════════════╝
set /p _selpartm=-   ^> 
if not defined _selpartm goto atszpart
set "_errp="&for /f "delims=0123456789" %%i in ("%_selpartm%") do set _errp=%%i
if defined _errp cls & echo. & echo. & echo     Você digitou "%_selpartm%". Você deve digitar apenas números. & echo. & echo     Pressione qualquer tecla para tentar novamente. . . & pause >nul & goto atszpart
set /a "calspart=%_selpartm%*1024"
set /a "pminimum=%calspart%+18"
cls
mode con: cols=78 lines=5
(echo select volume %HOMEDRIVE%&&echo shrink minimum=%pminimum% noerr&&echo create partition primary noerr&&echo format quick fs=NTFS label="Preparando-se. . ." noerr&&echo assign noerr&&echo Exit) >"%temp%\srk.txt"
cls & echo. & echo. & echo     Reduzindo partição %HOMEDRIVE%. . .
chcp 850 >nul
diskpart /s "%temp%\srk.txt" >nul&del /q /f "%temp%\srk.txt"
timeout /t 3 /nobreak >nul
cls
chcp 65001 >nul
set "ltrdrive="
if %winbld% LSS 17134 (
 for /f %%l in ('wmic logicaldisk get deviceid^, volumename ^| findstr /C:"Preparando-se. . ."') do set ltrdrive=%%l
)
if %winbld% GEQ 17134 (
  chcp 850 >nul
  for /f %%l in ('powershell -NoProfile -Command "& { Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.VolumeName -eq 'Preparando-se. . .' } | Select-Object -ExpandProperty DeviceID }"') do set ltrdrive=%%l
  chcp 65001 >nul
)
if "%ltrdrive%"=="" goto _nrpart
chcp 850 >nul
powershell -NoProfile -Command $pth = [uri]'%ltrdrive%\'; foreach ($w in (New-Object -ComObject Shell.Application).Windows()){if ($w.LocationURL -ieq $pth.AbsoluteUri) {$w.Quit(); break}}
goto chngLULib

:selpart
cls
chcp 65001 >nul
mode con: cols=85 lines=5
echo.
echo.
echo     Selecione uma partição para mover os arquivos da biblioteca do usuário. . .
set "twindow="
set "twdescr=Selecione uma partição para mover os arquivos da biblioteca do usuário."
set "twindow="(new-object -COM 'Shell.Application').BrowseforFolder(0,'%twdescr%',0x200,0).self.path""
chcp 850 >nul
for /f "usebackq delims=\" %%p in (`powershell %twindow%`) do set ltrdrive=%%p
chcp 65001 >nul
if "%ltrdrive%"=="" Exit
if "%ltrdrive%"=="%HOMEDRIVE%" goto atszpart

:chngLULib
cls
mode con: cols=78 lines=5
chcp 65001 >nul
cls & echo. & echo. & echo     Registrando novo local da biblioteca. . .
timeout /t 3 /nobreak >nul
set "srcUser=%USERPROFILE%"
set "dstUser=%ltrdrive%\%USERNAME%"
if not exist "%dstUser%" md "%dstUser%"
taskkill /f /im explorer.exe >nul 2>&1
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" >nul 2>&1
if "%ERRORLEVEL%"=="0" reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /t REG_EXPAND_SZ /d "%dstUser%\3D Objects" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%dstUser%\Desktop" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%dstUser%\Favorites" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%dstUser%\Music" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%dstUser%\Pictures" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%dstUser%\Videos" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%dstUser%\Documents" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%dstUser%\Downloads" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "%dstUser%\Pictures" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /t REG_EXPAND_SZ /d "%dstUser%\Videos" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{56784854-C6CB-462B-8169-88E350ACB882}" /t REG_EXPAND_SZ /d "%dstUser%\Contacts" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF786}" /t REG_EXPAND_SZ /d "%dstUser%\Documents" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "%dstUser%\Downloads" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d "%dstUser%\Saved Games" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /t REG_EXPAND_SZ /d "%dstUser%\Links" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d "%dstUser%\Music" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A52BBA46-E9E1-435F-B3D9-28DAA648C0F6}" /t REG_EXPAND_SZ /d "%dstUser%\OneDrive" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /t REG_EXPAND_SZ /d "%dstUser%\Searches" /f >nul
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
label %ltrdrive% BIBLIOTECA
timeout /t 3 /nobreak >nul
cls & echo. & echo. & echo     Concluído & timeout /t 5 /nobreak >nul
start "" "https://cutt.ly/Swh2uy0b"
start "" "https://www.youtube.com/@xerifetech?sub_confirmation=1"
explorer "%dstUser%"
Exit

:_nrpart
cls & mode con: cols=80 lines=9 & chcp 65001 >nul & echo. & echo. & echo     Não foi possível criar uma partição de %pminimum% MB. & echo. & echo     Erro na execução do Diskpart ou não há espaço & echo. & echo     suficiente para reduzir a partição %HOMEDRIVE%. & timeout /t 12 >nul
Exit
