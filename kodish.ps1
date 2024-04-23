# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o arquivo executável do Kodi
Write-Host "Baixando o Kodi da kodish [2/3]"
Invoke-WebRequest -Uri "https://archive.org/download/kodi_20240419/Kodi.exe" -OutFile "C:\down\kodi.exe"

# Executar o arquivo baixado
Write-Host "Iniciando a Inslação do Kodi da Kodish [3/3]"
Start-Process -FilePath "C:\down\kodi.exe"
pause

rm -r C:\down\*
