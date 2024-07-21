# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Kodi
Write-Host "Baixando [2/2]"
Invoke-WebRequest -Uri "https://www.heidoc.net/php/Windows-ISO-Downloader.exe" -OutFile "C:\down\Windows-ISO-Downloader.exe"

Start-Process -FilePath "C:\down\Windows-ISO-Downloader.exe"
