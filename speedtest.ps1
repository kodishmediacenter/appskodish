# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down

# Baixar o arquivo executável do 
Write-Host "Baixando o Speedtest [2/3]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/ookla/speedtest.exe" -OutFile "C:\down\speedtest.exe"

# Executar o arquivo baixado
Write-Host "Iniciando o Speedtest  [3/3]"
Start-Process -FilePath "C:\down\speedtest.exe"
