# Criar pasta base
mkdir C:\down
# Baixar o arquivo executável do Kodi
Invoke-WebRequest -Uri "https://archive.org/download/kodi_20240419/Kodi.exe" -OutFile "C:\down\kodi.exe"

# Executar o arquivo baixado
Start-Process -FilePath "C:\down\kodi.exe"


rm -r C:\down\*
