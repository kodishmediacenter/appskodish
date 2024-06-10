# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down

# Baixar o arquivo script menu classico
Write-Host "Baixando o script reativar menu classico [2/3]"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/menu-classico.cmd -OutFile "C:\down\menu-classico.cmd"


# Executar o arquivo baixado
Write-Host "Executar o arquivo  [3/3]"
Start-Process -FilePath "C:\down\menu-classico.cmd"
