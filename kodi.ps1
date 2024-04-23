# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o arquivo executável do Kodi
Write-Host "Baixando o Kodi 21.0 [2/3]"
Invoke-WebRequest -Uri "https://mirrors.kodi.tv/releases/windows/win64/kodi-21.0-Omega-x64.exe" -OutFile "C:\down\kodi.exe"

# Executar o arquivo baixado
Write-Host "Iniciando a Inslação do Kodi 21.0  [3/3]"
Start-Process -FilePath "C:\down\kodi.exe"
