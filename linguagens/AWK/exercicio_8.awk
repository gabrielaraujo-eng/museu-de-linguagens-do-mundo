# exercicio_8.awk -- relatorio de vendas por categoria
#
# Enunciado: a partir de registros "categoria valor", somar por categoria,
# calcular o total geral e o percentual de cada uma.
# Resolucao: FS/OFS, array associativo de totais e printf alinhado.
#
# Execucao:  awk -f exercicio_8.awk

BEGIN {
    FS = ";"
    dados = "livros;120.50\n" \
            "cursos;300\n" \
            "livros;79.50\n" \
            "software;450\n" \
            "cursos;99.90\n" \
            "livros;45"

    n = split(dados, linha, "\n")
    for (i = 1; i <= n; i++) {
        $0 = linha[i]
        total[$1] += $2
        geral += $2
        itens++
    }

    # for (c in total) nao garante ordem; copiamos as chaves e ordenamos
    m = 0
    for (c in total)
        chave[++m] = c
    for (i = 1; i <= m; i++) {
        menor = i
        for (j = i + 1; j <= m; j++)
            if (chave[j] < chave[menor])
                menor = j
        if (menor != i) {
            t = chave[i]; chave[i] = chave[menor]; chave[menor] = t
        }
    }

    printf "%-10s %10s\n", "categoria", "valor"
    printf "%-10s %10s\n", "---------", "----------"
    for (i = 1; i <= m; i++)
        printf "%-10s %10.2f\n", chave[i], total[chave[i]]
    printf "%-10s %10s\n", "---------", "----------"
    printf "%-10s %10.2f\n", "total", geral
    printf "itens: %d\n\n", itens

    printf "participacao percentual:\n"
    for (i = 1; i <= m; i++)
        printf "  %-10s %5.1f%%\n", chave[i], 100 * total[chave[i]] / geral
    exit
}
