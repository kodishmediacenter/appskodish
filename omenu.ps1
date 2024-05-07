Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
$opcao = Read-Host "Escolha uma opção (1 Kodi 2 Kodi da Kodish 3 Torr Server 4 Win Boot (Sayro DIgital e Duanny) 100 Remover Pasta de Download):"

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
        Write-Host "Baixar Win boot (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.ps1 | iex
    }
    '100' {
        Write-Host "Limpar a Pasta de Trabalho"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    Default {
        Write-Host "Opção inválida."
    }
}
