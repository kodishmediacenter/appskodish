# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o arquivo executável do Kodi
Write-Host "Baixando o Kodi da kodish [2/3]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/exm.cmd" -OutFile "C:\down\exm.cmd"

# Executar o arquivo baixado
Write-Host "Iniciando a Inslação do Kodi da Kodish [3/3]"
Start-Process -FilePath "C:\down\exm.cmd"
