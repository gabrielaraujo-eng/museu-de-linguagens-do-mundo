#Requires AutoHotkey v2.0
; exercicio_8.ahk - contagem de vogais e palavras em uma string
;
; Enunciado: contar quantas vogais e quantas palavras há em uma frase,
; ignorando diferenças entre maiúsculas e minúsculas.

frase := "AutoHotkey automatiza tarefas repetitivas do Windows"
minuscula := StringLower(frase)
vogais := "aeiou"

contagem := 0
for letra in StrSplit(minuscula) {
    if (InStr(vogais, letra))
        contagem += 1
}

palavras := StrSplit(frase, " ")

MsgBox("Frase: " frase
    . "`nCaracteres: " StrLen(frase)
    . "`nPalavras: " palavras.Length
    . "`nVogais: " contagem, "Exercício 8 - Strings")

; Distribuição por vogal, usando um Map como contador.
frequencia := Map()
for vogal in StrSplit(vogais)
    frequencia[vogal] := 0

for letra in StrSplit(minuscula) {
    if frequencia.Has(letra)
        frequencia[letra] += 1
}

detalhe := ""
for vogal, total in frequencia
    detalhe .= vogal ": " total "`n"

MsgBox(detalhe, "Exercício 8 - Frequência das vogais")
