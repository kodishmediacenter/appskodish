@Echo Off
chcp 65001 >nul
mode con: cols=60 lines=5
title Fix Internet Connection

call :VerPrevAdmin
if "%Admin%"=="ops" goto :eof

:iniciar
cls
mode con: cols=64 lines=12
title Resolver problemas de conectividade
echo.
echo     ╔═════════════════════════════════════════════════════╗
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ║░ REDEFINIR CONFIGURAÇÕES DE CONEXÃO COM A INTERNET ░║
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ╚═════════════════════════════════════════════════════╝
echo.    
echo     ═══════════════════════════════════════════════════════
echo     ███  Pressione qualquer tecla para continuar. . .   ███
echo     ═══════════════════════════════════════════════════════
pause >nul
cls
mode con: cols=64 lines=8
echo.
echo     ╔═════════════════════════════════════════════════════╗
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ║░░░░░░░░░░░░░ REDEFININDO, AGUARDE. . . ░░░░░░░░░░░░░║
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ╚═════════════════════════════════════════════════════╝
echo.
timeout /t 3 /nobreak >nul
:: Libera o endereço IP de todos os adaptadores conectados.
>nul 2>&1 ipconfig /release
:: Renova o endereço IP dos adaptadores, permitindo que eles peçam novos IPs ao DHCP.
>nul 2>&1 ipconfig /renew
:: Limpa o cache do DNS, eliminando informações potencialmente desatualizadas ou incorretas.
>nul 2>&1 ipconfig /flushdns
:: Redefine o catálogo Winsock de todos os adaptadores, resolvendo erros de conexão relacionados ao Winsock. 
>nul 2>&1 netsh winsock reset all
:: Redefine as configurações de IP de todos os adaptadores de rede para os valores padrão.
>nul 2>&1 netsh int ip reset all
:: Especificamente para resetar as configurações de IPv4, embora 'netsh int ip reset all' já trate disso.
>nul 2>&1 netsh int ipv4 reset all
:: Similar ao anterior, mas para IPv6.
>nul 2>&1 netsh int ipv6 reset all
:: Redefine os componentes do protocolo TCP/IP.
>nul 2>&1 netsh int tcp reset all
:: Redefine tudo relacionado ao protocolo de túnel 6to4.
>nul 2>&1 netsh int 6to4 reset all
:: Redefine o componente de túnel HTTPS.
>nul 2>&1 netsh int httpstunnel reset all
:: Lida com o reset do componente ISATAP.
>nul 2>&1 netsh int isatap reset all
:: Redefine tudo relacionado ao Teredo, um protocolo de túnel.
>nul 2>&1 netsh int teredo reset all
:: Redefine as configurações de proxy de porta.
>nul 2>&1 netsh int portproxy reset all
:: Restaura as configurações padrão do Firewall do Windows.
>nul 2>&1 netsh advfirewall reset
timeout /t 2 /nobreak >nul
cls
mode con: cols=70 lines=14
echo.
echo     ╔════════════════════════════════════════════════════════════╗
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ║░░                                                        ░░║
echo     ║░░                     CONCLUÍDO.                         ░░║
echo     ║░░                                                        ░░║
echo     ║░░     DESLIGUE SEUS DISPOSITIVOS DE ACESSO À REDE E      ░░║
echo     ║░░                                                        ░░║
echo     ║░░ PRESSIONE QUALQUER TECLA PARA REINICIAR O SISTEMA. . . ░░║
echo     ║░░                                                        ░░║
echo     ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
echo     ╚════════════════════════════════════════════════════════════╝
echo.
pause >nul
shutdown -r -t 30
Exit

:ElevAdmin
echo Set UAC = CreateObject^("Shell.Application"^) >"%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
goto Admin & Exit /b

:Admin
if exist "%temp%\getadmin.vbs" (del "%temp%\getadmin.vbs") & pushd "%CD%" & cd /d "%~dp0" & Exit

:VerPrevAdmin
fsutil dirty query %systemdrive% >nul
if not errorLevel 1 (
 mode con: cols=60 lines=5
 ) else (
   goto ElevAdmin & echo. & set "Admin=ops"
)
goto :eof
