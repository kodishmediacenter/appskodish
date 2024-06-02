# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "Baixando o Aomei Partition [2/2]"
Invoke-WebRequest -Uri "https://archive.org/download/aomei_202406/AOMEI.zip" -OutFile "C:\down\AOMEI.zip"

Write-Host "Download Comcluido para Continuar necessario ir a Pasta C:\down necessario extrair arquivo zip [3/3]"

