#Requires AutoHotkey v2.0
; exercicio_1.ahk - mensagem de duas linhas com dados fixos
;
; Enunciado: exibir duas linhas de texto em uma única janela, usando
; concatenação de variáveis e o escape `n (quebra de linha).

nome := "Visitante"
linguagem := "AutoHotkey v2"

mensagem := "Bem-vindo ao Museu de Linguagens, " nome "!"
mensagem .= "`nEsta pasta demonstra " linguagem "."

MsgBox(mensagem, "Exercício 1 - Olá")
