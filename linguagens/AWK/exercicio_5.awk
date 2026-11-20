# exercicio_5.awk -- fatorial recursivo e Fibonacci iterativo
#
# Enunciado: calcular 0! a 10! por recursao e os 10 primeiros numeros
# de Fibonacci por iteracao, comparando os dois estilos.
# Resolucao: funcao recursiva com caso base; laco com tres variaveis.
#
# Execucao:  awk -f exercicio_5.awk

function fatorial(n) {
    if (n <= 1)
        return 1
    return n * fatorial(n - 1)
}

BEGIN {
    print "n   n!            fibonacci"
    print "--  ------------  ---------"
    a = 0; b = 1
    for (i = 0; i <= 10; i++) {
        printf "%-2d  %-12d  %d\n", i, fatorial(i), a
        prox = a + b
        a = b
        b = prox
    }
    exit
}
