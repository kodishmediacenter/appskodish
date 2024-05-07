# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "Baixando o winboot.cmd [2/2]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.cmd" -OutFile "C:\down\winboot.cmd"

Write-Host "Iniciando o Script winboot [3/3]"
Start-Process -FilePath "C:\down\winboot.cmd"


