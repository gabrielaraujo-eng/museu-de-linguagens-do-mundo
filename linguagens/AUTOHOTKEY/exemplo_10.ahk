#Requires AutoHotkey v2.0
#SingleInstance Force
; exemplo_10.ahk - classe, ordenação por trocas, hotkey e hotstring
;
; AutoHotkey é uma linguagem de automação de desktop: além de código
; sequencial, um script pode registrar hotkeys (atalhos) e hotstrings
; (expansões de texto). Em v2 as duas formas usam a mesma sintaxe de
; função vista nos exemplos anteriores.

class Tarefa {
    __New(titulo, prioridade := 3) {
        this.Titulo := titulo
        this.Prioridade := prioridade
    }

    Descrever() {
        return Format("[P{1}] {2}", this.Prioridade, this.Titulo)
    }
}

; Ordenação por trocas (bubble sort) crescente pela prioridade.
OrdenarPorPrioridade(lista) {
    n := lista.Length
    while (n > 1) {
        i := 1
        while (i < n) {
            if (lista[i].Prioridade > lista[i + 1].Prioridade) {
                temp := lista[i]
                lista[i] := lista[i + 1]
                lista[i + 1] := temp
            }
            i += 1
        }
        n -= 1
    }
    return lista
}

tarefas := [
    Tarefa("Revisar textos", 2),
    Tarefa("Publicar site", 1),
    Tarefa("Arquivar mídia", 3)
]

OrdenarPorPrioridade(tarefas)

texto := ""
for tarefa in tarefas
    texto .= tarefa.Descrever() "`n"
MsgBox(texto, "Tarefas ordenadas por prioridade")

; --- A partir daqui vêm definições de hotkey/hotstring ---
; A seção de auto-execução termina no primeiro hotkey, por isso todo o
; código acima precisa vir antes destas linhas.

; Ctrl+J mostra uma mensagem
^j::MsgBox("Você pressionou Ctrl+J.", "Hotkey")

; Ctrl+Alt+D insere a data e a hora atuais na janela ativa
^!d:: {
    SendText(FormatTime(A_Now, "dd/MM/yyyy HH:mm"))
}

; Hotstring de auto-substituição: digite "museu" e espaço
::museu::Museu de Linguagens do Mundo

; Hotstring com corpo de função: executa código em vez de texto fixo
::saudacao::
{
    SendText("Olá! Este texto foi inserido por um hotstring.")
}
