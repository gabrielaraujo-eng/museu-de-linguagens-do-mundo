# exercicio_1.awk -- soma, media e contagem de uma lista de notas
#
# Enunciado: dado um conjunto de notas, calcular quantidade, soma, media
# e quantas ficaram acima ou iguais a media.
# Resolucao: split() gera o array de notas; dois lacos percorrem os dados.
#
# Execucao:  awk -f exercicio_1.awk

BEGIN {
    notas = "7.5 9 6.5 8 10 5.5 4"

    n = split(notas, v, " ")
    soma = 0
    for (i = 1; i <= n; i++)
        soma += v[i]

    media = soma / n

    acima = 0
    for (i = 1; i <= n; i++)
        if (v[i] >= media)
            acima++

    printf "notas .......: %d\n", n
    printf "soma ........: %.2f\n", soma
    printf "media .......: %.2f\n", media
    printf ">= media ....: %d de %d\n", acima, n
    printf "situacao ....: %s\n", (media >= 7 ? "aprovado" : "recuperacao")
    exit
}
