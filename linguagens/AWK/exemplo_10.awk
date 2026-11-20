# exemplo_10.awk -- algoritmos: ordenacao e busca binaria
#
# Arrays associativos nao tem ordem garantida; para ordenar, copia-se
# para um array indexado de 1..n e aplica-se um algoritmo classico.
#
# Execucao:  awk -f exemplo_10.awk

# ordenacao por insercao, in place, em a[1..n]
function ordena(a, n,   i, j, chave) {
    for (i = 2; i <= n; i++) {
        chave = a[i]
        j = i - 1
        while (j >= 1 && a[j] > chave) {
            a[j + 1] = a[j]
            j--
        }
        a[j + 1] = chave
    }
}

# busca binaria em a[1..n] ja ordenado; devolve o indice ou -1
function busca_binaria(a, n, alvo,   lo, hi, meio) {
    lo = 1; hi = n
    while (lo <= hi) {
        meio = int((lo + hi) / 2)
        if (a[meio] == alvo)
            return meio
        if (a[meio] < alvo)
            lo = meio + 1
        else
            hi = meio - 1
    }
    return -1
}

BEGIN {
    dados = "42 7 19 3 88 56 11 73 25 60"
    n = split(dados, v, " ")

    printf "original: %s\n", dados
    ordena(v, n)

    printf "ordenado:"
    for (i = 1; i <= n; i++)
        printf " %d", v[i]
    print ""

    printf "minimo=%d maximo=%d mediana=%.1f\n", v[1], v[n], (n % 2 ? v[(n + 1) / 2] : (v[n / 2] + v[n / 2 + 1]) / 2)

    for (i = 1; i <= 3; i++) {
        alvo = (i == 1) ? 56 : (i == 2 ? 100 : 3)
        pos = busca_binaria(v, n, alvo)
        if (pos < 0)
            printf "busca %d: nao encontrado\n", alvo
        else
            printf "busca %d: encontrado na posicao %d\n", alvo, pos
    }
    exit
}
