# exemplo_4.awk -- lacos: for, while, do-while, break e continue
#
# AWK tem apenas as formas C de repeticao (nao existe "for x in lista");
# o "for (i in array)" percorre indices de array associativo.
#
# Execucao:  awk -f exemplo_4.awk

BEGIN {
    print "-- for com contador"
    for (i = 1; i <= 4; i++)
        printf "i=%d  i*i=%d\n", i, i * i

    print "-- while"
    n = 1
    while (n < 100)
        n *= 3
    printf "primeira potencia de 3 >= 100: %d\n", n

    print "-- do-while (executa ao menos uma vez)"
    k = 10
    do {
        printf "k=%d\n", k
        k--
    } while (k > 7)

    print "-- break e continue: somar impares de 1 a 9"
    soma = 0
    for (i = 1; i <= 20; i++) {
        if (i > 9) break          # sai do laco
        if (i % 2 == 0) continue  # pula os pares
        soma += i
    }
    printf "soma dos impares de 1 a 9 = %d\n", soma

    print "-- for (indice in array)"
    cor["ceu"] = "azul"
    cor["grama"] = "verde"
    cor["sol"] = "amarelo"
    for (k in cor)
        printf "%-6s -> %s\n", k, cor[k]
    exit
}
