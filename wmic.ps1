# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "Baixando o wmic.cmd [2/2]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/wmic.cmd" -OutFile "C:\down\wmic.cmd"

Write-Host "Iniciando o Script wwmic.cmd [3/3]"
Start-Process -FilePath "C:\down\wmic.cmd"
