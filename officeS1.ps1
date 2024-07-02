# Criar pasta base
Write-Host "Criando pasta Download [1/2]"
mkdir C:\down

# Baixar o arquivo executável do Winboot
Write-Host "############## Microsoft Office ####################/n/n"
Write-Host "1 - Office Pro Plus 2024 Retail"
Write-Host "2 - Office Pro Plus 2021 Volume"
Write-Host "3 - Office Pro Plus 2019 Volume"
$opcao = Read-Host "`n Escolha uma Opção:"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/office.cmd" -OutFile "C:\down\setup.cmd"
switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação MS Office 2019"
        Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/setup.exe" -OutFile "C:\down\setup.exe"
		Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/ProPlus2019Volume.xml" -OutFile "C:\down\setup.xml"
		Start-Process -FilePath "C:\down\setup.cmd"

    }
    '2' {
        Write-Host "Iniciar a Instalação MS Office 2021"
        Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/setup.exe" -OutFile "C:\down\setup.exe"
		Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/ProPlus2021Volume.xml" -OutFile "C:\down\setup.xml"
		Start-Process -FilePath "C:\down\setup.cmd"
    }
    '3'{
        Write-Host "Iniciar a Instalação MS Office 2024"
        Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/setup.exe" -OutFile "C:\down\setup.exe"
		Invoke-WebRequest -Uri "https://archive.org/download/pro-plus-2024-retail/ProPlus2024Retail.xml" -OutFile "C:\down\setup.xml"
		Start-Process -FilePath "C:\down\setup.cmd"
    }
	'4'{
		& ([ScriptBlock]::Create((irm https://get.activated.win))) /Ohook
	}	
    Default {
        Write-Host "Opção inválida."
    }
}
