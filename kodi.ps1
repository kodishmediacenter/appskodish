# rm -r C:\down\
mkdir C:\down\
cd C:\down\

# Baixar o arquivo executável usando Invoke-WebRequest
Invoke-WebRequest -Uri "https://mirrors.kodi.tv/releases/windows/win64/kodi-21.0-Omega-x64.exe" -OutFile "C:\down\kodi.exe"

# Executar o arquivo baixado
Start-Process -FilePath "C:\down\kodi.exe"

# Baixar o arquivo ZIP usando Invoke-WebRequest
Invoke-WebRequest -Uri "https://github.com/elgatito/plugin.video.elementum/releases/download/v0.1.101/plugin.video.elementum-0.1.101.windows_x64.zip" -OutFile "C:\down\plugin.video.elementum.zip"
Invoke-WebRequest -Uri "https://github.com/ElementumOrg/service.lt2http/releases/download/v0.0.16/service.lt2http-0.0.16.zip" -OutFile "C:\down\service.lt2http.zip"
Invoke-WebRequest -Uri "https://github.com/elgatito/script.elementum.burst/releases/download/v0.0.86/script.elementum.burst-0.0.86.zip" -OutFile "C:\down\script.elementum.burst.zip"
Invoke-WebRequest -Uri "https://github.com/elgatito/context.elementum/releases/download/v0.0.13/context.elementum-0.0.13.zip" -OutFile "C:\down\context.elementum.zip"


# Descompactar o arquivo ZIP
Expand-Archive -Path "C:\down\plugin.video.elementum.zip" -DestinationPath "env:APPDATA\Kodi\addons"
Expand-Archive -Path "C:\down\service.lt2http.zip" -DestinationPath "env:APPDATA\Kodi\addons"
Expand-Archive -Path "C:\down\script.elementum.burst.zip" -DestinationPath "env:APPDATA\Kodi\addons"
Expand-Archive -Path "C:\down\context.elementum.zip" -DestinationPath "env:APPDATA\Kodi\addons"


 
