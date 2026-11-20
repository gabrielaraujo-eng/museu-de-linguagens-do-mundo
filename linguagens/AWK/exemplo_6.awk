# exemplo_6.awk -- arrays associativos: indice e chave, nao posicao
#
# Em awk todo array e associativo (hash): o indice pode ser texto.
#   a["chave"] = valor
#   "chave" in a      testa existencia
#   for (k in a)      percorre as chaves em ordem nao especificada
#   delete a["chave"] apaga um elemento
# Arrays numericos de 1..n tambem funcionam; aqui contamos palavras.
#
# Execucao:  awk -f exemplo_6.awk

BEGIN {
    texto = "a casa caiu e a casa era azul e o azul do ceu e o ceu da casa"

    n = split(texto, palavra, /[^a-z]+/)
    for (i = 1; i <= n; i++) {
        if (palavra[i] == "")
            continue
        if (!(palavra[i] in cont))   # "in" testa se a chave ja existe
            distintas++
        cont[palavra[i]]++          # incrementa; valor inicial e 0
    }

    # length(array) e extensao do gawk; o contador acima e portavel
    printf "palavras distintas: %d\n", distintas
    printf "total de ocorrencias: %d\n\n", n

    for (w in cont)
        printf "%-6s %d\n", w, cont[w]

    # remover palavras de uma letra
    for (w in cont)
        if (length(w) == 1)
            delete cont[w]

    print "\napos remover palavras de 1 letra:"
    for (w in cont)
        printf "%-6s %d\n", w, cont[w]

    print "\nconsulta pontual:"
    print ("casa" in cont) ? "  casa presente" : "  casa ausente"
    print ("e" in cont)    ? "  e presente"    : "  e ausente"
    exit
}
