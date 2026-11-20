# exercicio_6.awk -- frequencia de palavras em ordem decrescente
#
# Enunciado: contar a frequencia das palavras de um texto e listar da
# mais frequente para a menos frequente.
# Resolucao: array associativo para contar; as chaves sao copiadas para
# um array 1..n e ordenadas por selecao, comparando contagens.
#
# Execucao:  awk -f exercicio_6.awk

BEGIN {
    texto = "o sol nasce o sol se poe e o mundo gira o mundo muda"

    n = split(texto, palavra, " ")
    for (i = 1; i <= n; i++)
        cont[palavra[i]]++

    # copiar as chaves para um array indexado
    m = 0
    for (w in cont)
        chave[++m] = w

    # ordenacao por selecao: maior contagem primeiro; empate por ordem alfabetica
    for (i = 1; i <= m; i++) {
        melhor = i
        for (j = i + 1; j <= m; j++)
            if (cont[chave[j]] > cont[chave[melhor]] || \
                (cont[chave[j]] == cont[chave[melhor]] && chave[j] < chave[melhor]))
                melhor = j
        if (melhor != i) {
            t = chave[i]; chave[i] = chave[melhor]; chave[melhor] = t
        }
    }

    print "palavra  frequencia"
    for (i = 1; i <= m; i++)
        printf "%-8s %d\n", chave[i], cont[chave[i]]
    exit
}
