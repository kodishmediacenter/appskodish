Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
write-Host "1 Kodi `n" 
write-Host "2 Kodi da Kodish `n "
write-Host "3 Torr Server (64 bits) `n" 
write-Host "4 Torr Server (32 bits) `n" 
write-Host "5 Win Boot (Sayro Digital e Duanny) `n"
write-Host "6 Fix Internet (Sayro Digital e Duanny) `n" 
write-Host "7 Test Defrag Disk (Sayro Digital e Duanny) `n"
write-Host "8 Baixar Winget `n"
write-Host "100 Remover Pasta de Download`n"
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
    '3'{
        Write-Host "Baixar Torr Server for Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr.ps1 | iex
    }
    '4'{
        Write-Host "Baixar Torr Server for Windows 32 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr32bits.ps1 | iex
    }
    
    '5'{
        Write-Host "Baixar Win boot (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.ps1 | iex
    }
	'6'{
        Write-Host "Baixar Fix Internet (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Fixinternet.ps1 | iex
    }
	'7'{
        Write-Host "Baixar Test Defrag Disk (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/TestDefragDisk.ps1 | iex
    }
    	'8'{
    	write-Host "Baixando Winget Script"
     	irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winget.ps1 | iex
    }
    '100' {
        Write-Host "Limpar a Pasta de Trabalho"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    Default {
        Write-Host "Opção inválida."
    }
}
