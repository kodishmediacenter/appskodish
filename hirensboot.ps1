# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o Hirens Boot (Linorg)
Write-Host "Baixando o Kodi da kodish [2/3]"
Invoke-WebRequest -Uri "https://linorg.usp.br/hbcd/HBCD_PE_x64.iso" -OutFile "C:\down\HBCD_PE_x64.iso"
