# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "Baixando o FixInternetConnect.cmd [2/2]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/scripts/%23FixInternetConnect/FixInternetConnect.cmd" -OutFile "C:\down\FixInternetConnect.cmd"

Write-Host "Iniciando o Script winboot [3/3]"
Start-Process -FilePath "C:\down\FixInternetConnect.cmd"