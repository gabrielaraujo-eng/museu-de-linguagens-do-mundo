#Requires AutoHotkey v2.0
; exercicio_5.ahk - potência inteira por função recursiva
;
; Enunciado: escrever uma função recursiva Potencia(base, expoente) que
; calcule base elevado a expoente sem usar o operador **. Expoentes
; negativos devolvem o inverso do resultado positivo.

Potencia(base, expoente) {
    if (expoente = 0)
        return 1
    if (expoente < 0)
        return 1 / Potencia(base, -expoente)
    return base * Potencia(base, expoente - 1)
}

MsgBox("2^10 = " Potencia(2, 10))
MsgBox("3^4 = " Potencia(3, 4))
MsgBox("5^0 = " Potencia(5, 0))
MsgBox("2^-3 = " Format("{:.4f}", Potencia(2, -3)))

; Verificação contra o operador nativo, que deve dar o mesmo valor.
base := 7
expoente := 5
recursivo := Potencia(base, expoente)
nativo := base ** expoente
MsgBox(base "^" expoente ": recursivo = " recursivo ", operador ** = " nativo, "Exercício 5")
