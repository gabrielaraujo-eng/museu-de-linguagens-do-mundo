#Requires AutoHotkey v2.0
; exercicio_10.ahk - agenda de contatos com Map
;
; Enunciado: manter uma agenda nome -> telefone em um Map, consultar um
; contato, inserir outro, remover um terceiro e listar o resultado final.

agenda := Map(
    "Ana", "11 90000-1111",
    "Bruno", "21 90000-2222",
    "Carla", "31 90000-3333"
)

; 1) Consulta de um contato existente
procurado := "Bruno"
if agenda.Has(procurado)
    MsgBox(procurado ": " agenda[procurado], "Exercício 10 - Consulta")
else
    MsgBox("Contato '" procurado "' não encontrado.", "Exercício 10")

; 2) Consulta de um contato inexistente
procurado := "Diego"
if agenda.Has(procurado)
    MsgBox(procurado ": " agenda[procurado], "Exercício 10")
else
    MsgBox("Contato '" procurado "' não encontrado.", "Exercício 10")

; 3) Inserção e remoção
agenda["Diego"] := "41 90000-4444"
agenda.Delete("Ana")

; 4) Listagem final
listagem := ""
for nome, telefone in agenda
    listagem .= nome " - " telefone "`n"

MsgBox(listagem "Total: " agenda.Count " contatos.", "Exercício 10 - Agenda")
