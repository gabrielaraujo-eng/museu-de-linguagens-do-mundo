#Requires AutoHotkey v2.0
; exercicio_3.ahk - classificação de um inteiro
;
; Enunciado: para um número inteiro fixo, informar se é positivo, negativo
; ou zero e se é par ou ímpar, usando if/else if/else e o operador ternário.

numero := -7

if (numero > 0)
    sinal := "positivo"
else if (numero < 0)
    sinal := "negativo"
else
    sinal := "zero"

paridade := (Mod(numero, 2) = 0) ? "par" : "ímpar"

MsgBox("O número " numero " é " sinal " e " paridade ".", "Exercício 3")

; Segunda classificação, para mostrar que o mesmo bloco serve a outro valor.
outro := 42
if (outro > 0)
    sinal := "positivo"
else if (outro < 0)
    sinal := "negativo"
else
    sinal := "zero"

MsgBox("O número " outro " é " sinal " e " ((Mod(outro, 2) = 0) ? "par" : "ímpar") ".", "Exercício 3")
