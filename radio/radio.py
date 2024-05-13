import vlc
import os
import ctypes
def set_console_title(title):
    ctypes.windll.kernel32.SetConsoleTitleW(title)



def limpar_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def carregar_estacoes(m3u_file):
    estacoes = []
    with open(m3u_file, 'r', encoding='utf-8') as file:
        for line in file:
            if line.startswith('#EXTINF'):
                parts = line.split(',')
                nome = parts[1].strip()
                url = next(file).strip()
                estacoes.append((nome, url))
    return estacoes

def exibir_menu(estacoes):
    #print("Escolha uma estação de rádio:")
    for i, (nome, _) in enumerate(estacoes, start=1):
        print(f"{i}. {nome}")

def reproduzir_estacao(estacoes, escolha):
    if escolha < 1 or escolha > len(estacoes):
        print("Escolha inválida.")
        return
    
    nome, url = estacoes[escolha - 1]
    limpar_tela()
    print(f"Reproduzindo {nome}")
    
    player = vlc.MediaPlayer(url)
    player.play()
    
    # Aguarda a reprodução terminar
    while True:
        if player.get_state() == vlc.State.Ended:
            break
    limpar_tela()

if __name__ == "__main__":
    new_title = "Radio Kodish"
    set_console_title(new_title)
    arquivo_m3u = 'estacoes_radio.m3u'
    estacoes = carregar_estacoes(arquivo_m3u)
    
    while True:
        #print("==== Kodish Radio ====\n")
        exibir_menu(estacoes)
        escolha = input("Digite o número da estação ou 'q' para sair: ")
        
        if escolha.lower() == 'q':
            break
        
        try:
            escolha = int(escolha)
            reproduzir_estacao(estacoes, escolha)
        except ValueError:
            print("Por favor, digite um número válido.")
