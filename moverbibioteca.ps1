Clear-Host
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
Write-Host "══════════════════════════════════════════════════ Kodish Store Para Windows ════════════════════════════════════════════════════════════"
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"
Write-Host "`n"
Write-Host "1 Criar o Backup da Biblioteca " 
Write-Host "2 Restaurar o Backup da Biblioteca "
Write-Host "3 Leiame " 
Write-Host "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════`n`n"
$opcao = Read-Host "`n Escolha uma Opção:"

switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação do Kodi"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Mover_Biblioteca.cmd | iex
    }
    '2' {
        Write-Host "Iniciar a Instalação do Kodi da Kodish"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Restaurar.cmd | iex
    }
    '3' {
        Write-Host "Baixar Torr Server para Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Leia-me%20primeiro.txt | iex
    }

)