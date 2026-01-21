import vlc
import tkinter as tk
from tkinter import messagebox, Listbox, Scrollbar
import os

# -------------------------------
# Carregar M3U
# -------------------------------
def carregar_estacoes(m3u_file):
    estacoes = []
    if not os.path.exists(m3u_file):
        messagebox.showerror("Erro", f"Arquivo {m3u_file} não encontrado.")
        return estacoes

    with open(m3u_file, 'r', encoding='utf-8') as file:
        for line in file:
            if line.startswith('#EXTINF'):
                parts = line.split(',')
                nome = parts[1].strip()
                url = next(file).strip()
                estacoes.append((nome, url))
    return estacoes

# -------------------------------
# Player VLC
# -------------------------------
player = None

def tocar():
    global player
    sel = lista_estacoes.curselection()
    if not sel:
        messagebox.showwarning("Aviso", "Selecione uma estação.")
        return

    nome, url = estacoes[sel[0]]

    # Parar anterior
    parar()

    status_var.set(f"Tocando: {nome}")

    player = vlc.MediaPlayer(url)
    player.play()

def parar():
    global player
    if player is not None:
        player.stop()
    status_var.set("Parado")

# -------------------------------
# Interface Tkinter
# -------------------------------
root = tk.Tk()
root.title("Radio Kodish")
root.geometry("400x350")

# Estações
arquivo_m3u = "estacoes_radio.m3u"
estacoes = carregar_estacoes(arquivo_m3u)

# Lista com scroll
scroll = Scrollbar(root)
scroll.pack(side="right", fill="y")

lista_estacoes = Listbox(root, font=("Arial", 12))
lista_estacoes.pack(fill="both", expand=True, padx=10, pady=10)

lista_estacoes.config(yscrollcommand=scroll.set)
scroll.config(command=lista_estacoes.yview)

# Preencher lista
for nome, _ in estacoes:
    lista_estacoes.insert("end", nome)

# Botões
frame_botoes = tk.Frame(root)
frame_botoes.pack(pady=10)

btn_tocar = tk.Button(frame_botoes, text="▶ Tocar", width=12, command=tocar)
btn_tocar.grid(row=0, column=0, padx=5)

btn_parar = tk.Button(frame_botoes, text="■ Parar", width=12, command=parar)
btn_parar.grid(row=0, column=1, padx=5)

# Status
status_var = tk.StringVar()
status_var.set("Parado")

status_label = tk.Label(root, textvariable=status_var, anchor="w")
status_label.pack(fill="x", padx=10, pady=5)

root.mainloop()
