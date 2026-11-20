# exercicio_9.awk -- estatistica descritiva de uma amostra
#
# Enunciado: para uma amostra de medidas, calcular n, minimo, maximo,
# media, variancia populacional e desvio padrao.
# Resolucao: dois lacos (media e depois desvios) e sqrt() no final.
#
# Execucao:  awk -f exercicio_9.awk

BEGIN {
    amostra = "12.4 11.9 13.2 12.8 12.1 13.0 11.5 12.6"
    n = split(amostra, x, " ")

    soma = 0
    min = x[1]; max = x[1]
    for (i = 1; i <= n; i++) {
        soma += x[i]
        if (x[i] < min) min = x[i]
        if (x[i] > max) max = x[i]
    }
    media = soma / n

    soma2 = 0
    for (i = 1; i <= n; i++)
        soma2 += (x[i] - media) ^ 2
    variancia = soma2 / n

    printf "n ................: %d\n", n
    printf "minimo ...........: %.2f\n", min
    printf "maximo ...........: %.2f\n", max
    printf "amplitude ........: %.2f\n", max - min
    printf "media ............: %.4f\n", media
    printf "variancia (pop.) .: %.4f\n", variancia
    printf "desvio padrao ....: %.4f\n", sqrt(variancia)
    printf "coef. variacao ...: %.2f%%\n", 100 * sqrt(variancia) / media
    exit
}
