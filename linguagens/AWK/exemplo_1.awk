# exemplo_1.awk -- estrutura de um programa awk: BEGIN, regras e END
#
# Um programa awk e uma sequencia de pares "padrao { acao }":
#   BEGIN  roda antes de qualquer leitura de entrada;
#   END    roda depois do ultimo registro lido;
#   padrao sem BEGIN/END roda para cada registro da entrada.
# Este exemplo nao le entrada: gera os proprios dados e encerra no BEGIN.
#
# Execucao:  awk -f exemplo_1.awk

BEGIN {
    # print separa os argumentos com OFS, que vale " " por padrao
    print "Ola, Mundo!"
    print "programa", "awk", "em execucao"

    # variaveis em awk sao globais e nascem com valor vazio/zero
    soma = 0
    for (i = 1; i <= 5; i++)
        soma += i

    # printf nao insere separadores: o formato controla tudo
    printf "soma de 1..5 = %d\n", soma
    printf "media       = %.2f\n", soma / 5

    exit          # encerra a leitura; o bloco END ainda roda
}

END {
    print "fim do programa"
}
