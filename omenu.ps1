Clear-Host
Write-Host "========================================================================================================================================="
Write-Host "======================== Kodish Store Para Windows ======================================================================================"
Write-Host "========================================================================================================================================="
Write-Host "`n"
write-Host "1 Kodi `n" 
write-Host "2 Kodi da Kodish `n "
write-Host "3 Torr Server (64 bits) `n" 
write-Host "4 Torr Server (32 bits) `n" 
write-Host "5 Win Boot (Sayro Digital e Duanny) `n"
write-Host "6 Fix Internet (Sayro Digital e Duanny) `n" 
write-Host "7 Test Defrag Disk (Sayro Digital e Duanny) `n"
write-Host "8 Baixar Winget `n"
write-Host "9 Instalar Wmic para Windows 11 24H2 `n"
write-Host "10 Voltar menu do botão direito do mouse classico (win 11) `n"
write-Host "11 Baixar Aomei Partition para auxiliar nas partições do seu Computador  `n"
write-Host "12 Acessar Apps para Download  `n"
write-Host "13 Acessar EXM Tweeks  `n"
write-Host "14 Acessar Win 11 Debloat  `n"
write-Host "100 Remover Pasta de Download`n"
write-Host "101 Reiniciar o Explorer"
$opcao = Read-Host "`n Escolha uma Opção:"

switch ($opcao) {
    '1' {
        Write-Host "Iniciar a Instalação do Kodi"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/kodi.ps1 | iex
    }
    '2' {
        Write-Host "Iniciar a Instalação do Kodi da Kodish"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/kodish.ps1 | iex
    }
    '3'{
        Write-Host "Baixar Torr Server for Windows 64 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr.ps1 | iex
    }
    '4'{
        Write-Host "Baixar Torr Server for Windows 32 bits"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/torr32bits.ps1 | iex
    }
    
    '5'{
        Write-Host "Baixar Win boot (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winboot.ps1 | iex
    }
	'6'{
        Write-Host "Baixar Fix Internet (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/Fixinternet.ps1 | iex
    }
	'7'{
        Write-Host "Baixar Test Defrag Disk (Sayro DIgital e Duanny)"
        irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/TestDefragDisk.ps1 | iex
    }
    	'8'{
    	write-Host "Baixando Winget Script"
     	irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/winget.ps1 | iex
    }
    	'9'{
     	write-Host "Baixando Wmic para Windows 11"
      	irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/wmic.ps1 | iex     
   }
   	'10'{
        write-Host "Baixando script do menu classico do botão direito do mouse windows 11"
   	irm  https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/menu-classico1.ps1 | iex 
  }
     	'11'{
        write-Host "Baixando Aomei Partition"
   	irm  https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/aomei.ps1 | iex 
  }
  	'12'{
        write-Host "Acessando Ninite Apps"
   	irm  https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/ninite2.ps1 | iex 
  }
    	'13'{
        write-Host "Acessando Ninite Apps"
   	irm https://raw.githubusercontent.com/kodishmediacenter/appskodish/main/exm.ps1 | iex 
  }
  	'14'{
   	& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/Raphire/Win11Debloat/master/Get.ps1")))
  }

       '100' {
        Write-Host "Limpar a Pasta de Trabalho"
        Remove-Item -Path "C:\down\" -Recurse -Force
    }
    	'101'{
     	Stop-Process -Name explorer -Force
      	Start-Process explorer
     }
    Default {
        Write-Host "Opção inválida."
    }
}
