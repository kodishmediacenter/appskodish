# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
# Baixar o Hirens Boot (Linorg)
Write-Host "Baixar o Hirens Boot (Linorg) [2/3]"
Start-BitsTransfer -Source "https://linorg.usp.br/hbcd/HBCD_PE_x64.iso" -Destination "C:\down\HBCD_PE_x64.iso"

Write-Host "Baixar o Hirens Boot (Linorg) [3/3]"
