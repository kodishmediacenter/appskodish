# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "Baixando o Aomei Partition [2/2]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Windows-Edition-Switcher.cmd" -OutFile "C:\down\WESwitcher.cmd"

Write-Host "Download Comcluido para Continuar necessario ir a Pasta C:\down necessario extrair arquivo zip [3/3]"
Start-Process -FilePath "WESwitcher.cmd"
