Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
Write-Host "1 Kodi `n" 
Write-Host "2 Kodi da Kodish `n"
Write-Host "3 Torr Server (64 bits) `n" 
Write-Host "4 Torr Server (32 bits) `n" 
Write-Host "5 Win Boot (Sayro Digital e Duanny) `n"
Write-Host "6 Fix Internet (Sayro Digital e Duanny) `n" 
Write-Host "7 Test Defrag Disk (Sayro Digital e Duanny) `n"
Write-Host "8 Baixar Winget `n"
Write-Host "9 Instalar Wmic para Windows 11 24H2 `n"
Write-Host "10 Voltar menu do botão direito do mouse clássico (Win 11) `n"
Write-Host "11 Baixar Aomei Partition para auxiliar nas partições do seu Computador  `n"
Write-Host "12 Acessar Apps para Download  `n"
Write-Host "13 Acessar EXM Tweaks  `n"
Write-Host "14 Acessar Win 11 Debloat  `n"
Write-Host "15 Instalar Microsoft Office `n"

Write-Host "100 Remover Pasta de Download `n"
Write-Host "101 Reiniciar o Explorer `n"
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
        Write-Host "Baixar Torr Server para Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr.ps1 | iex
    }
    '4' {
        Write-Host "Baixar Torr Server para Windows 32 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr32bits.ps1 | iex
    }
    '5' {
        Write-Host "Baixar Win Boot (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.ps1 | iex
    }
    '6' {
        Write-Host "Baixar Fix Internet (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Fixinternet.ps1 | iex
    }
    '7' {
        Write-Host "Baixar Test Defrag Disk (Sayro Digital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/TestDefragDisk.ps1 | iex
    }
    '8' {
        Write-Host "Baixando Winget Script"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winget.ps1 | iex
    }
    '9' {
        Write-Host "Baixando Wmic para Windows 11"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/wmic.ps1 | iex     
    }
    '10' {
        Write-Host "Baixando script do menu clássico do botão direito do mouse para Windows 11"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/menu-classico1.ps1 | iex 
    }
    '11' {
        Write-Host "Baixando Aomei Partition"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/aomei.ps1 | iex 
    }
    '12' {
        Write-Host "Acessando Ninite Apps"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/ninite2.ps1 | iex 
    }
    '13' {
        Write-Host "Acessando EXM Tweaks"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/exm.ps1 | iex 
    }
    '14' {
        & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Raphire/Win11Debloat/master/Get.ps1")))
    }
    '15' {
        Write-Host "Acessando Office"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/officeS1.ps1 | iex 
    }
    '16' {
        Write-Host "Correção do Crowdstrike"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/crowdstrike.ps1 | iex 
    }
    '100' {
        Write-Host "Limpar a Pasta de Downloads"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    '101' {
        Stop-Process -Name explorer -Force
        Start-Process explorer
    }
    Default {
        Write-Host "Opção inválida."
    }
}
