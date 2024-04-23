Clear-Host
Write-Host "==============================================================================================================================="
Write-Host "======================== Menu de Scripts ======================================================================================"
Write-Host "==============================================================================================================================="

$opcao = Read-Host "Escolha uma opção (1 Kodi 2 Kodi da Kodish 3 Remover pasta temporaria):"

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
        Write-Host "Limpar a Pasta de Trabalho"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    Default {
        Write-Host "Opção inválida."
    }
}
