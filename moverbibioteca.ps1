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
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Mover_Biblioteca.cmd" -OutFile "C:\down\Mover_Biblioteca.cmd"
        Start-Process -FilePath "C:\down\Mover_Biblioteca.cmd"
    }
    '2' {
        
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Restaurar.cmd" -OutFile "C:\down\Restaurar.cmd"
        Start-Process -FilePath "C:\down\Restaurar.cmd"
    }
    '3' {
        Write-Host "Baixar Torr Server para Windows 64 bits"
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Biblioteca/Leia-me%20primeiro.txt" -OutFile "C:\down\leiame.txt"
        Start-Process -FilePath "C:\down\leiame.txt"
    }

}
