Clear-Host
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
Write-Host "══════════════════════════════════════════════════ Kodish Store Para Windows ════════════════════════════════════════════════════════════"
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
Write-Host "`n"
Write-Host "`n"
Write-Host "1 Kodi " 
Write-Host "2 Kodi 22.2.2 da Kodish "
Write-Host "3 Kodi 22.2.3 Catz da Kodish"
Write-Host "4 Torr Server (64 bits) " 
Write-Host "5 Torr Server (32 bits) " 
Write-Host "6 Win Boot (Sayro Digital e Duanny) "
Write-Host "7 Fix Internet (Sayro Digital e Duanny) " 
Write-Host "8 Test Defrag Disk (Sayro Digital e Duanny) "
Write-Host "9 Baixar Winget "
Write-Host "10 Instalar Wmic para Windows 11 24H2 "
Write-Host "11 Voltar menu do botão direito do mouse clássico (Win 11) "
Write-Host "12 Baixar Aomei Partition para auxiliar nas partições do seu Computador  "
Write-Host "13 Acessar Apps para Download  "
Write-Host "14 Acessar EXM Tweaks  "
Write-Host "15 Acessar Win 11 Debloat  "
Write-Host "16 Instalar Microsoft Office "
Write-Host "17 Remover o Bug CrowdStrike "
Write-Host "18 Baixar Heidoc (Download Windows | Office)"
Write-Host "19 Mudar a Versão do Windows 11"
Write-Host "20 Baixar Hirens Boot 1.0.8"
Write-Host "21 Instalar todos Vcredists [2005-2015+]"
Write-Host "22 Backup da Biblioteca do Usuario [Sayro Digital]"
Write-Host "23 Win Utils do Chris Titus"
Write-Host "24 Flyby para pular os requisitos de Instalação do Windows 11"
Write-Host "25 CFixer para ajustar seu Windows"
Write-Host "`n"
Write-Host "100 Remover Pasta de Download"
Write-Host "101 Reiniciar o Explorer "
Write-Host "102 Medir a Velocidade da Internet "
Write-Host "103 Baixar UUP Dump (Windows 11)  `n"
Write-Host "104 Baixar Radio  `n"
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════`n`n"
$opcao = Read-Host "`n Escolha uma Opção:"

switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação do Kodi"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/kodi.ps1 | iex
    }
    '2' {
        Write-Host "Iniciar a Instalação do Kodi da Kodish"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/kodish.ps1 | iex
    }
    '3' {
        Write-Host "Iniciar a Instalação do Kodi da Kodish"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/Kodimod.ps1 | iex
    }
    '4' {
        Write-Host "Baixar Torr Server para Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr.ps1 | iex
    }
    '5' {
        Write-Host "Baixar Torr Server para Windows 32 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr32bits.ps1 | iex
    }
    '6' {
        Write-Host "Baixar Win Boot (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.ps1 | iex
    }
    '7' {
        Write-Host "Baixar Fix Internet (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Fixinternet.ps1 | iex
    }
    '8' {
        Write-Host "Baixar Test Defrag Disk (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/TestDefragDisk.ps1 | iex
    }
    '9' {
        Write-Host "Baixando Winget Script"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winget.ps1 | iex
    }
    '10' {
        Write-Host "Baixando Wmic para Windows 11"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/wmic.ps1 | iex     
    }
    '11' {
        Write-Host "Baixando script do menu clássico do botão direito do mouse para Windows 11"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/menu-classico1.ps1 | iex 
    }
    '12' {
        Write-Host "Baixando Aomei Partition"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/aomei.ps1 | iex 
    }
    '13' {
        Write-Host "Acessando Ninite Apps"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/ninite2.ps1 | iex 
    }
    '14' {
        Write-Host "Acessando EXM Tweaks"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/exm.ps1 | iex 
    }
    '15' {
        & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Raphire/Win11Debloat/master/Get.ps1")))
    }
    '16' {
        Write-Host "Acessando Office"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/officeS1.ps1 | iex 
    }
    '17' {
        Write-Host "Correção do Crowdstrike"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/crowdstrike2.ps1 | iex 
    }
    '18' {
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/windows.ps1 | iex 
    }
    '19' {
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/windows-switcher.ps1 | iex 
    }
    '20' {
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/hirensboot1.ps1 | iex 
    }
    '21'{
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/vcredist.ps1 | iex
    }
    '22'{
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/moverbibioteca.ps1 | iex
    }
    '23'{
        irm "https://christitus.com/win" | iex
    }
    '24'{
        irm "https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/flyby.ps1" | iex
    }
    '25'{
        irm "https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/cfixer.ps1" | iex
    }
    '100' {
        Write-Host "Limpar a Pasta de Downloads"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    '101' {
        Stop-Process -Name explorer -Force
        Start-Process explorer
    }
    '102' {
       irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/speedtest.ps1 | iex
    }
    '103' {
       irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/uupdump.bat | iex
    }
    '104' {
       irm  https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/radio.ps1 | iex
    }
    Default {
        Write-Host "Opção inválida."
    }
}
