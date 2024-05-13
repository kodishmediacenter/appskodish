@Echo Off
mode 71,5
title TestDefragDisk v2024.2.1
chcp 65001 >nul
:: Feito por @DuanyDias a pedido do Grupo Sayro Digital
call :VerPrevAdmin
if "%Admin%"=="ops" goto :eof

if exist "%temp%\dkdyn.txt" del /Q /F "%temp%\dkdyn.txt"
setlocal enabledelayedexpansion
set   "idesc=da"
set     "dID=Nº"
set   "MType=Conexão"
set "HStatus=Saúde"
set  "vlabel=Rótulo"
for /f "tokens=2* delims=	 " %%i in ('reg query "HKLM\System\CurrentControlSet\Services\disk\Enum" /v Count') do set /a "gdcnt=%%j-1"
set /a wlns=%gdcnt%+9
if not %gdcnt%.==0. set "idesc=de uma"
cls
mode 73,18
title TestDefragDisk - v2024.2.1 by @DuanyDias
echo.
echo     ══════════════════════════════════════════════════════════════════
echo     █████       Escolha uma das opções para continuar. . .       █████
echo     ══════════════════════════════════════════════════════════════════
echo.
echo      ╔══════════════════════════════════════════════════════════════╗
echo      ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo      ║░ [1] LIMPEZA DE DISCO PARA WINDOWS - CLEANMGR ░░░░░░░░░░░░░░░║
echo      ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo      ║░ [2] LISTAR UNIDADES: INFORMAÇÕES, PERFORMANCE E OTIMIZAÇÃO ░║
echo      ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo      ╚══════════════════════════════════════════════════════════════╝
echo.
echo     ══════════════════════════════════════════════════════════════════
echo     █████                Pressione 'x' para sair.                █████
echo     ══════════════════════════════════════════════════════════════════
choice /n /c 12x /m "-   > "
if errorlevel 3 goto _end
if errorlevel 2 goto diskinfo
if errorlevel 1 goto clnadvcd

:diskinfo
cls
mode 100,%wlns%
title Informações das unidades de disco: testar desempenho e otimizar
chcp 850 >nul
powershell -c "Get-PhysicalDisk | ForEach-Object {$disk = $_; $srCounter = $disk | Get-StorageReliabilityCounter; [PSCustomObject]@{'%dID%' = $disk.DeviceID; 'Modelo' = $disk.Model; 'Tipo' = $disk.MediaType; '%MType%' = $disk.BusType; 'Tam.(GB)' = [int]($disk.Size/1GB); '%HStatus%' = $disk.HealthStatus; 'StatusOp.' = $disk.OperationalStatus; 'Desgaste(%%)' = $srCounter.Wear}} | Format-Table -AutoSize"
chcp 65001 >nul
set dnum=
set /p dnum=Digite o número %idesc% unidade e pressione 'enter': 
if not defined dnum (cls&goto diskinfo)
set "_err="&for /f "delims=0123456789" %%i in ("%dnum%") do set _err=%%i
if defined _err (cls&goto diskinfo)
if %dnum% Leq %gdcnt% (goto cklttrs)
if not %dnum% Leq %gdcnt% (cls&goto diskinfo)

:cklttrs
cls
set lttrs=
for /f "delims==" %%z in ('set Disk 2^>nul') do set "%%z="
for /f delims^= %%v in ('wmic diskdrive Assoc /AssocClass:Win32_DiskDriveToDiskPartition 2^>nul^|find /i "Disk #%dnum%"') do (
  for /f tokens^=2delims^=^" %%w in ("%%v") do (
    for /f tokens^=2^,4delims^=^" %%x in ('wmic path Win32_LogicalDiskToPartition 2^>nul^|find "%%w" 2^>nul') do (
      for /f "tokens=2delims=#," %%z in ("%%x") do (
        if defined Disk%%z (
          call set "Disk%%z=%%Disk%%z%% %%y"
          ) else (
            set "Disk%%z=%%y"
        )
      )
    )
  )
)
for /f "tokens=2 delims==" %%z in ('set Disk 2^>nul') do set "lttrs=%%z"
if "%lttrs%"=="" (cls&mode 65,5&echo.&echo.&echo     Não há partições na unidade de disco selecionada.&timeout /t 5 /nobreak >nul&goto diskinfo)
set _lttr=%lttrs: =%
set _lttrs=%_lttr::=%
call :_strc
set "dkdyn=0"
chcp 850 >nul
powershell -c "$dkdyn = '%temp%\dkdyn.txt'; $partts = Get-Partition -DiskNumber %dnum% -ErrorAction SilentlyContinue | Where-Object { $_.DriveLetter }; if ($partts) {'0' | Out-File -FilePath $dkdyn -encoding default} else {'1' | Out-File -FilePath $dkdyn -encoding default}"
chcp 65001 >nul
set /p dkdyn=<"%temp%\dkdyn.txt"
if %dkdyn%.==0. set /a _wlns=!cnt!+12
if %dkdyn%.==1. set /a _wlns=!cnt!+20
del /Q /F "%temp%\dkdyn.txt" >nul 2>&1

:ftasks
cls
mode 65,%_wlns%
title Desempenho e otimização
echo.
echo Escolha uma partição para testar desempenho e otimizar
echo ══════════════════════════════════════════════════════
chcp 850 >nul
powershell -c "$partts = Get-Partition -DiskNumber %dnum% -ErrorAction SilentlyContinue | Where-Object { $_.DriveLetter }; if ($partts) {$volsInfo = foreach ($partt in $partts) {$volume = Get-Volume -Partition $partt; [PSCustomObject]@{'Letra' = $volume.DriveLetter; '%vlabel%' = $volume.FileSystemLabel; 'FS' = $volume.FileSystemType; 'Esp.Livre(GB)' = [int]($volume.SizeRemaining/1GB); 'Tam.(GB)' = [int]($volume.Size/1GB)}}; $volsInfo | Format-Table -AutoSize} else {$volLttrs = Get-Volume | Where-Object {$_.DriveLetter -ne $null -and $_.DriveType -ne 'CD-ROM'}; $volstbl = foreach ($volume in $volLttrs) {[PSCustomObject]@{'Letra' = $volume.DriveLetter; '%vlabel%' = $volume.FileSystemLabel; 'FS' = $volume.FileSystemType; 'Esp.Livre(GB)' = [int]($volume.SizeRemaining/1GB); 'Tam.(GB)' = [int]($volume.Size/1GB)}}; $volstbl | Format-Table -AutoSize}"
chcp 65001 >nul
echo ══════════════════════════════════════════════════════
set lttr=
set /p lttr=Digite a letra da partição e pressione 'enter': 
if not defined lttr (cls&goto ftasks)
if not "%lttr:~1,1%"=="" (cls&goto ftasks)
echo %_lttrs%|find /i "%lttr%">nul
if errorlevel 1 (cls&goto ftasks)
if %lttr%.==c. set "lttr=C"
cls
mode 100,30
title Testando desempenho em %lttr%:. . .
echo.
winsat disk -drive %lttr%
echo.
title Otimizar partição
choice /n /c SN /m "- Otimizar partição %lttr%:? (S ou N): "
if errorlevel 2 goto _end
if errorlevel 1 goto _defrag

:_defrag
cls
mode 120,40
if "%lttr%:"=="%HOMEDRIVE%" (cls & echo. & echo Selecionada a partição do Windows. Incluída a otimização do boot. & chcp 850 >nul & defrag %lttr%: /B /O /U /H /V)
if not "%lttr%:"=="%HOMEDRIVE%" (cls & chcp 850 >nul & defrag %lttr%: /O /U /H /V)
chcp 65001 >nul
echo.
echo Pressione qualquer tecla para sair. . .
pause >nul
goto _end

:clnadvcd
cls
mode 60,5
title Limpeza de Disco para Windows
if exist "%temp%\tmpfdrs.txt" del /Q /F "%temp%\tmpfdrs.txt"
set "_gnrkp=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
set "_vknm=StateFlags6553"
(echo Active Setup Temp Folders&&echo BranchCache&&echo D3D Shader Cache&&echo Delivery Optimization Files&&echo Diagnostic Data Viewer database files&&echo Downloaded Program Files&&echo Feedback Hub Archive log files&&echo Internet Cache Files&&echo Language Pack&&echo Old ChkDsk Files&&echo Recycle Bin&&echo RetailDemo Offline Content&&echo Setup Log Files&&echo System error memory dump files&&echo System error minidump files&&echo Temporary Files&&echo Temporary Setup Files&&echo Thumbnail Cache&&echo Update Cleanup&&echo User file versions&&echo Windows Defender&&echo Windows Error Reporting Files&&echo Windows ESD installation files&&echo Windows Upgrade Log Files) >"%temp%\tmpfdrs.txt"
cls & echo. & echo. & echo     Verificando/Marcando opções do Cleanmgr, aguarde. . .
for /f "tokens=*" %%# in ('type "%temp%\tmpfdrs.txt"') do (
  set _tmpfldr=%%#
  reg query "%_gnrkp%\!_tmpfldr!" /v "%_vknm%" >nul 2>&1
  if errorlevel 1 (reg add "%_gnrkp%\!_tmpfldr!" /v %_vknm% /t REG_DWORD /d 2 /f >nul 2>&1)
)
timeout /t 3 /nobreak >nul
del /Q /F "%temp%\tmpfdrs.txt" >nul 2>&1
cls & mode 55,5 & echo. & echo. & echo     Executando limpeza de disco. . .
cleanmgr /sagerun:6553
chcp 850 >nul
powershell Stop-Process -Name explorer
chcp 65001 >nul
cls & echo. & echo. & echo     Concluída.&timeout /t 5 /nobreak >nul & goto diskinfo

:_end
cls
start "" "https://cutt.ly/Swh2uy0b"
start "" "https://www.youtube.com/@xerifetech?sub_confirmation=1"
Exit

:_strc
if not defined cnt set /a "cnt=0"
if not "!_lttrs:~%cnt%,1!"=="" set /a "cnt+=1"&goto _strc
goto :eof

:ElevAdmin
echo Set UAC = CreateObject^("Shell.Application"^) >"%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
goto Admin & Exit /b

:Admin
if exist "%temp%\getadmin.vbs" (del "%temp%\getadmin.vbs") & pushd "%CD%" & cd /d "%~dp0" & Exit

:VerPrevAdmin
fsutil dirty query %systemdrive% >nul
if not errorlevel 1 (
 mode 71,5
 ) else (
   goto ElevAdmin & echo. & set "Admin=ops"
)
goto :eof
