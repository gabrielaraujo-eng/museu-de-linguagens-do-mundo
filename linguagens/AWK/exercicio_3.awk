# exercicio_3.awk -- tabuada formatada de 1 a 5
#
# Enunciado: imprimir a tabuada de multiplicacao de 1 a 5, alinhada
# em colunas, com cabecalho.
# Resolucao: lacos for aninhados e printf com largura fixa (%4d).
#
# Execucao:  awk -f exercicio_3.awk

BEGIN {
    printf "    ";
    for (j = 1; j <= 5; j++)
        printf "%4d", j;
    printf "\n";
    printf "    ";
    for (j = 1; j <= 5; j++)
        printf "%4s", "----";
    printf "\n";

    for (i = 1; i <= 5; i++) {
        printf "%3d|", i;
        for (j = 1; j <= 5; j++)
            printf "%4d", i * j;
        printf "\n";
    }

    # diagonal principal e soma da tabela, calculadas de novo
    soma = 0; diagonal = 0
    for (i = 1; i <= 5; i++)
        for (j = 1; j <= 5; j++) {
            soma += i * j
            if (i == j)
                diagonal += i * j
        }
    printf "soma da tabela = %d; diagonal = %d\n", soma, diagonal
    exit
}
