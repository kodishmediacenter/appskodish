Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
write-Host "1 Chrome `n" 
write-Host "2 Firefox `n "
write-Host "3 Dot Net `n" 
#write-Host "4 Torr Server (32 bits) `n" 
$opcao = Read-Host "`n Escolha uma Opção:"

switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação do Kodi"
        # Criar pasta base
		Write-Host "Criando pasta Download [1/3]"
		mkdir C:\down
		
		# Baixar o arquivo executável do Kodi
		Write-Host "Baixando o Chrome [2/3]"
		Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/chrome.exe" -OutFile "C:\down\chrome.exe"

		# Executar o arquivo baixado
		Write-Host "Iniciando a Inslação do Chrome via Ninite  [3/3]"
		Start-Process -FilePath "C:\down\chrome.exe"
    }
    '2' {
# Criar pasta base
		Write-Host "Criando pasta Download [1/3]"
		mkdir C:\down
		# Baixar o arquivo executável do Kodi
		Write-Host "Baixando o Firefox[2/3]"
		Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/firefox.exe" -OutFile "C:\down\firefox.exe"

		# Executar o arquivo baixado
		Write-Host "Iniciando a Inslação do Firefox via Ninite  [3/3]"
		Start-Process -FilePath "C:\down\firefox.exe"
    }
    '3'{
		# Criar pasta base
		Write-Host "Criando pasta Download [1/3]"
		mkdir C:\down
		# Baixar o arquivo executável do Kodi
		Write-Host "Baixando o Dotnet [2/3]"
		Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/dotnet.exe" -OutFile "C:\down\dotnet.exe"

		# Executar o arquivo baixado
		Write-Host "Iniciando a Inslação do Dot net via Ninite  [3/3]"
		Start-Process -FilePath "C:\down\dotnet.exe"
    }
    '4'{
        Write-Host "Baixar Torr Server for Windows 32 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr32bits.ps1 | iex
    }
    Default {
        Write-Host "Opção inválida."
    }
}
