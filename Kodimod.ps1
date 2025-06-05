# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o arquivo executável do Kodi
Write-Host "Baixando o Kodi 21.2.3 mod by Kodish  [2/3]"
Invoke-WebRequest -Uri "https://archive.org/download/kodi_20250605/Kodi.exe" -OutFile "C:\down\Kodi.exe"

# Executar o arquivo baixado
Write-Host "Iniciando a Inslação do Kodi 21.0  [3/3]"
Start-Process -FilePath "C:\down\Kodi.exe"
