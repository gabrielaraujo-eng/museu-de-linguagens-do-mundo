#Requires AutoHotkey v2.0
; exercicio_4.ahk - soma dos números pares de 1 a 20
;
; Enunciado: somar apenas os números pares no intervalo de 1 a 20 usando
; o laço Loop e a variável A_Index. Resultado esperado: 110.

soma := 0
quantidade := 0

Loop 20 {
    if (Mod(A_Index, 2) != 0)
        continue
    soma += A_Index
    quantidade += 1
}

MsgBox("Pares somados: " quantidade "`nSoma dos pares de 1 a 20 = " soma, "Exercício 4")

; Conferência com while, para comparar as duas formas de laço.
soma2 := 0
i := 2
while (i <= 20) {
    soma2 += i
    i += 2
}

MsgBox("Conferência com while: " soma2, "Exercício 4")
