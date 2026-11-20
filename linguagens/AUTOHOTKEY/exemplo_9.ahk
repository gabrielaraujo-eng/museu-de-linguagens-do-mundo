#Requires AutoHotkey v2.0
; exemplo_9.ahk - operadores e funções matemáticas
;
; A divisão com / sempre produz número real. Para a parte inteira use
; Floor(); para o resto, Mod(). O operador ** calcula potência.

a := 17
b := 5

MsgBox("Soma: " (a + b) "`nSubtração: " (a - b) "`nMultiplicação: " (a * b))
MsgBox("Divisão real: " Format("{:.3f}", a / b))
MsgBox("Parte inteira de " a " / " b ": " Floor(a / b))
MsgBox("Resto (Mod): " Mod(a, b))
MsgBox("Potência 2 ** 10 = " (2 ** 10))

MsgBox("Raiz quadrada de 144: " Sqrt(144))
MsgBox("Arredondar 3.6 -> " Round(3.6) " | 3.4 -> " Round(3.4))
MsgBox("Piso de 3.6: " Floor(3.6) " | Teto de 3.4: " Ceil(3.4))
MsgBox("Valor absoluto de -8: " Abs(-8))
MsgBox("Máximo de 3, 9 e 5: " Max(3, 9, 5) " | Mínimo: " Min(3, 9, 5))

; Cálculo das raízes de x^2 - 5x + 6 = 0 (fórmula de Bhaskara)
coefA := 1, coefB := -5, coefC := 6
delta := coefB ** 2 - 4 * coefA * coefC
MsgBox("Delta = " delta)

if (delta >= 0) {
    x1 := (-coefB + Sqrt(delta)) / (2 * coefA)
    x2 := (-coefB - Sqrt(delta)) / (2 * coefA)
    MsgBox("Raízes: " Format("{:.1f}", x1) " e " Format("{:.1f}", x2))
} else {
    MsgBox("Não há raízes reais.")
}

; Juros compostos com arredondamento a duas casas
capital := 1000
taxa := 0.05
meses := 12
montante := capital * (1 + taxa) ** meses
MsgBox("Montante após " meses " meses: R$ " Format("{:.2f}", Round(montante, 2)))
