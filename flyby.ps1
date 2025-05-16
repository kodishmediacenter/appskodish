# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Kodi
Write-Host "Baixando o Flyby11 [2/2]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/Flyby11.zip" -OutFile "C:\down\Flyby11.zip"

