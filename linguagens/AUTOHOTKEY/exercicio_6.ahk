#Requires AutoHotkey v2.0
; exercicio_6.ahk - inversão de um Array de cinco posições
;
; Enunciado: receber um Array com cinco elementos e produzir outro Array
; com os mesmos elementos em ordem inversa, sem alterar o original.

Inverter(lista) {
    resultado := Array()
    i := lista.Length
    while (i >= 1) {
        resultado.Push(lista[i])
        i -= 1
    }
    return resultado
}

original := ["a", "b", "c", "d", "e"]
invertido := Inverter(original)

texto := "Original:  "
for valor in original
    texto .= valor " "
texto .= "`nInvertido: "
for valor in invertido
    texto .= valor " "

MsgBox(texto, "Exercício 6 - Inversão de Array")

; Conferência: o original continua na mesma ordem e os tamanhos coincidem.
MsgBox("Primeiro do original: " original[1] "`nPrimeiro do invertido: " invertido[1]
    . "`nTamanhos: " original.Length " e " invertido.Length, "Exercício 6")
