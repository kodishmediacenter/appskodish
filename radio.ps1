# Criar pasta base
Write-Host "Criando pasta radio [1/5]"
mkdir C:\radio

# Baixar os Arquivos
Write-Host "Baixando os arquivos [2/5]"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/radio/radio.py" -OutFile "C:\radio\radio.py"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/radio/estacoes_radio.m3u" -OutFile "C:\radio\estacoes_radio.m3u"

Write-Host "Instalando VLC [3/5]"
pip install python-vlc

Invoke-WebRequest -Uri "https://get.videolan.org/vlc/3.0.20/win32/vlc-3.0.20-win32.exe" -OutFile "C:\radio\vlc.exe"
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe" -OutFile "C:\radio\python.exe"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/radio/radio.ico" -OutFile "C:\radio\radio.ico"
Write-Host "Iniciando o Script winboot [5/5]"
Start-Process -FilePath "C:\radio\vlc.exe"
Start-Process -FilePath "C:\radio\python.exe"

# Definir o caminho do atalho e o destino do aplicativo
$shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), 'Kodish Radio.lnk')
$targetPath = 'C:\radio\radio.py'

# Definir o caminho do ícone
$iconPath = 'C:\radio\radio.ico'

# Criar o COM Object para o Windows Script Host
$wshShell = New-Object -ComObject WScript.Shell

# Criar o atalho
$shortcut = $wshShell.CreateShortcut($shortcutPath)

# Definir propriedades do atalho
$shortcut.TargetPath = $targetPath
$shortcut.Arguments = '' # Adicione argumentos se necessário
$shortcut.WorkingDirectory = [System.IO.Path]::GetDirectoryName($targetPath)
$shortcut.IconLocation = "$iconPath, 0" # Defina o ícone do atalho
$shortcut.Save()
