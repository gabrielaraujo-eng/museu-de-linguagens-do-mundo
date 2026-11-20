# exemplo_9.awk -- funcoes matematicas e formatos numericos
#
# int(x) trunca para zero; sqrt, exp, log, sin, cos, atan2 sao as funcoes
# da biblioteca; rand() devolve [0,1) e srand(x) fixa a semente.
# Nao existe arredondamento pronto: usa-se int(x + 0.5) para positivos.
#
# Execucao:  awk -f exemplo_9.awk

function arredonda(x) {
    return (x >= 0) ? int(x + 0.5) : -int(-x + 0.5)
}

BEGIN {
    printf "int(3.9)      = %d\n", int(3.9)
    printf "int(-3.9)     = %d\n", int(-3.9)
    printf "arredonda(3.5)= %d\n", arredonda(3.5)
    printf "sqrt(2)       = %.10f\n", sqrt(2)
    printf "exp(1)        = %.10f\n", exp(1)
    printf "log(10)       = %.10f\n", log(10)
    printf "sin(pi/6)     = %.10f\n", sin(3.14159265358979 / 6)
    printf "cos(pi/3)     = %.10f\n", cos(3.14159265358979 / 3)
    printf "atan2(1,1)    = %.10f rad (%.2f graus)\n", atan2(1, 1), atan2(1, 1) * 180 / 3.14159265358979

    printf "mesmo valor em 4 formatos: %d | %.4f | %e | %g\n", 1234.5678, 1234.5678, 1234.5678, 1234.5678

    # srand(1) fixa a semente, mas a sequencia de rand() varia entre
    # implementacoes (gawk, mawk, busybox); por isso os valores abaixo
    # sao apenas ilustrativos.
    srand(1)
    print "tres valores de rand() com srand(1):"
    for (i = 1; i <= 3; i++)
        printf "  %.6f\n", rand()

    # distribuicao de 10 lancamentos de um dado de 6 faces
    for (i = 1; i <= 10; i++) {
        face = int(rand() * 6) + 1
        freq[face]++
    }
    for (f = 1; f <= 6; f++)
        printf "face %d: %d\n", f, freq[f] + 0
    exit
}
