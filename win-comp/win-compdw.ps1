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
        #Write-Host "Criando pasta Download [1/3]"
        mkdir C:\down
        # Baixar o arquivo executável do Kodi
        Write-Host "Baixando o Script do Windows"
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win10-22h2.cmd" -OutFile "C:\down\win10-22h2.cmd"

        # Executar o arquivo baixado
        Write-Host "Iniciando a compilação do Windows [3/3]"
        Start-Process -FilePath "C:\down\win10-22h2.cmd"
    }
    '2' {
        mkdir C:\down
        # Baixar o arquivo executável do Kodi
        Write-Host "Baixando o Script do Windows"
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win11-23h2.cmd" -OutFile "C:\down\win11-23h2.cmd"

        # Executar o arquivo baixado
        Write-Host "Iniciando a compilação do Windows [3/3]"
        Start-Process -FilePath "C:\down\win11-23h2.cmd"
	    }
    '3'{
        mkdir C:\down
        # Baixar o arquivo executável do Kodi
        Write-Host "Baixando o Script do Windows [2/3]"
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/win-comp/win11-24h2.cmd" -OutFile "C:\down\win11-23h2.cmd"

        # Executar o arquivo baixado
        Write-Host "Iniciando a compilação do Windows [3/3]"
        Start-Process -FilePath "C:\down\win11-23h2.cmd"

    }
    Default {
        Write-Host "Opção inválida."
    }
}
