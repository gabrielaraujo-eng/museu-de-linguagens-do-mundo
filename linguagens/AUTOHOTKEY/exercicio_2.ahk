#Requires AutoHotkey v2.0
; exercicio_2.ahk - conversão de Celsius para Fahrenheit
;
; Enunciado: pedir uma temperatura em graus Celsius e mostrar o valor
; correspondente em Fahrenheit, com uma casa decimal.
; Fórmula: F = C * 9 / 5 + 32
;
; A entrada é validada com RegExMatch, que devolve 0 quando o texto não
; casa com o padrão. Assim aceitamos apenas números com sinal e decimal
; opcionais, sem depender de conversão silenciosa de texto inválido.

entrada := InputBox("Temperatura em graus Celsius:", "Exercício 2 - Conversor", "w320")

if (entrada.Result != "OK")
    ExitApp()

texto := Trim(entrada.Value)

if (!RegExMatch(texto, "^-?\d+(\.\d+)?$")) {
    MsgBox("'" texto "' não é um número válido.", "Exercício 2")
    ExitApp()
}

celsius := Float(texto)
fahrenheit := celsius * 9 / 5 + 32

MsgBox(Format("{:.1f} °C equivalem a {:.1f} °F", celsius, fahrenheit), "Exercício 2")
