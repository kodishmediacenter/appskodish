Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
write-Host "1 Windows 10 22H2 `n" 
write-Host "2 Windows 11 23H2 `n"
write-Host "3 Windows 10 24H2 `n" 
write-Host "100 Remover Pasta de Download`n"
$opcao = Read-Host "`n Escolha uma Opção:"

switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação do Kodi"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win10-22h2.cmd | iex
    }
    '2' {
        Write-Host "Iniciar a Instalação do Kodi da Kodish"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win11-23h2.cmd | iex
    }
    '3'{
        Write-Host "Baixar Torr Server for Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win11-24h2.cmd | iex
    }
    Default {
        Write-Host "Opção inválida."
    }
}
