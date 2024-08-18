# Criar pasta base
Write-Host "Criando pasta Download [1/3]"
mkdir C:\down
Write-Host "Baixando os Scripts  [2/3]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/vcdist/wglista64.txt" -OutFile "C:\down\wglista64.txt"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/vcdist/winget_instalarProgramas.cmd" -OutFile "C:\down\winget_instalarProgramas.cmd"
Write-Host "Baixando os Scripts  [3/3]"
Start-Process -FilePath "C:\down\winget_instalarProgramas.cmd"
