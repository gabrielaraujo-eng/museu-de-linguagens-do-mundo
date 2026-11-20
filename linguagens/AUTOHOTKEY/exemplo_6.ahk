#Requires AutoHotkey v2.0
; exemplo_6.ahk - estruturas de dados: Array e Map
;
; Array é indexado por inteiros a partir de 1 e cresce dinamicamente.
; Map associa chaves (strings ou números) a valores e não tem ordem
; garantida na iteração. Os dois são objetos, não tipos primitivos.

; --- Map ---
capitais := Map(
    "Brasil", "Brasília",
    "Argentina", "Buenos Aires",
    "Chile", "Santiago"
)

MsgBox("Países cadastrados: " capitais.Count)

if capitais.Has("Chile")
    MsgBox("Capital do Chile: " capitais["Chile"])

relatorio := ""
for pais, capital in capitais
    relatorio .= pais " -> " capital "`n"
MsgBox(relatorio, "Exemplo 6 - Map")

capitais["Uruguai"] := "Montevidéu"   ; inserção
capitais.Delete("Argentina")          ; remoção
MsgBox("Após inserir e remover, restam " capitais.Count " países.")

; --- Array ---
numeros := Array()          ; array vazio
Loop 5
    numeros.Push(A_Index * 10)

MsgBox("Itens: " numeros.Length "`nPrimeiro: " numeros[1] "`nÚltimo: " numeros[numeros.Length])

numeros.InsertAt(1, 5)                ; insere 5 na posição 1
numeros.RemoveAt(numeros.Length)      ; remove o último item
MsgBox("Depois das edições: " numeros.Length " itens; primeiro = " numeros[1])

; Array literal e acesso por índice negativo não existe: use Length.
letras := ["a", "b", "c"]
MsgBox("Segunda letra: " letras[2] " (de " letras.Length ")")

; Objetos podem ser aninhados.
turma := Map("A", ["Ana", "Alice"], "B", ["Bruno"])
for grupo, alunos in turma
    MsgBox("Grupo " grupo ": " alunos.Length " aluno(s); primeiro = " alunos[1])
