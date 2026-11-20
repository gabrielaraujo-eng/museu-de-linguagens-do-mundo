#Requires AutoHotkey v2.0
; exercicio_9.ahk - média, maior e menor de um conjunto de notas
;
; Enunciado: percorrer um Array de notas e informar a média, a maior e a
; menor nota, além da quantidade de notas acima da média.

notas := [7.5, 9.0, 4.5, 8.0, 6.0]

soma := 0
maior := notas[1]
menor := notas[1]

for nota in notas {
    soma += nota
    if (nota > maior)
        maior := nota
    if (nota < menor)
        menor := nota
}

media := soma / notas.Length

acima := 0
for nota in notas {
    if (nota > media)
        acima += 1
}

relatorio := Format("Quantidade de notas: {1}`nMédia: {2:.2f}`nMaior: {3:.1f}`nMenor: {4:.1f}`nAcima da média: {5}",
    notas.Length, media, maior, menor, acima)

MsgBox(relatorio, "Exercício 9 - Estatísticas")
