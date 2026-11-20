#Requires AutoHotkey v2.0
; exemplo_1.ahk - estrutura mínima de um script e saída com MsgBox
;
; Um script AutoHotkey v2 é um arquivo .ahk executado pelo interpretador
; AutoHotkey.exe (somente Windows). A diretiva #Requires recusa executar o
; arquivo em versões 1.x, evitando que a sintaxe v2 seja lida como v1.

#SingleInstance Force

; Em v2, MsgBox é uma função: os argumentos vão entre parênteses.
; O primeiro argumento é o texto; o segundo, opcional, é o título da janela.
MsgBox("Olá, Mundo!", "Exemplo 1 - Olá Mundo")

; Também é possível guardar o resultado: MsgBox devolve o nome do botão
; pressionado ("OK", "Yes", "No", "Cancel", "Timeout", ...).
resposta := MsgBox("Este é o primeiro script da pasta. Continuar?", "Exemplo 1", "YesNo")
if (resposta = "Yes")
    MsgBox("Você escolheu continuar.", "Exemplo 1")
else
    MsgBox("Você escolheu parar.", "Exemplo 1")
