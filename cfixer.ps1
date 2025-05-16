

# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o arquivo executável do Kodi
Write-Host "Baixando o CFixer[2/3]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/refs/heads/main/CFixer.exe" -OutFile "C:\down\CFixer.exe"

# Executar o arquivo baixado
Write-Host "Iniciando a Inslação do CFixer  [3/3]"
Start-Process -FilePath "C:\down\CFixer.exe"
