#Requires AutoHotkey v2.0
; exercicio_7.ahk - divisão protegida contra divisor zero
;
; Enunciado: criar uma função de divisão que lance uma exceção quando o
; divisor for zero e tratar o erro com try/catch, continuando o laço.

Dividir(a, b) {
    if (b = 0)
        throw ValueError("Divisão por zero não é permitida.")
    return a / b
}

casos := [[10, 2], [7, 0], [9, 3], [-8, 4]]
relatorio := ""

for caso in casos {
    try {
        resultado := Dividir(caso[1], caso[2])
        relatorio .= Format("{1} / {2} = {3:.2f}`n", caso[1], caso[2], resultado)
    }
    catch ValueError as e {
        relatorio .= Format("{1} / {2} -> erro: {3}`n", caso[1], caso[2], e.Message)
    }
}

MsgBox(relatorio, "Exercício 7 - Divisão protegida")

; O erro não interrompeu o script: o laço chegou ao último caso.
MsgBox("Casos processados: " casos.Length, "Exercício 7")
