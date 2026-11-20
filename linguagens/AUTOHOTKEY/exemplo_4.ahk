#Requires AutoHotkey v2.0
; exemplo_4.ahk - repetições: Loop, while e for, com break e continue
;
; Em v2 a vírgula depois de Loop foi removida: escreve-se "Loop 5", e não
; "Loop, 5". A variável embutida A_Index conta as iterações a partir de 1.

; 1) Loop com contagem fixa
soma := 0
Loop 5 {
    soma += A_Index
}
MsgBox("Soma de 1 a 5 = " soma)

; 2) Loop sem contagem, encerrado por break
contador := 0
Loop {
    contador += 1
    if (contador >= 3)
        break
}
MsgBox("O laço infinito parou em " contador ".")

; 3) while com condição avaliada antes de cada iteração
potencia := 1
while (potencia < 100) {
    potencia *= 2
}
MsgBox("Primeira potência de 2 maior ou igual a 100: " potencia)

; 4) for sobre um Array: o primeiro nome recebe o índice, o segundo o valor
frutas := ["banana", "maçã", "uva"]
lista := ""
for indice, fruta in frutas
    lista .= indice ". " fruta "`n"
MsgBox(lista, "Exemplo 4 - for em Array")

; 5) for sobre um Map: primeiro a chave, depois o valor
idades := Map("Ana", 34, "Bruno", 28)
relatorio := ""
for pessoa, idade in idades
    relatorio .= pessoa ": " idade " anos`n"
MsgBox(relatorio, "Exemplo 4 - for em Map")

; 6) continue salta para a próxima iteração
impares := ""
Loop 10 {
    if (Mod(A_Index, 2) = 0)
        continue
    impares .= A_Index " "
}
MsgBox("Ímpares de 1 a 10: " Trim(impares))
