# exemplo_3.awk -- padroes: expressao regular, comparacao e NR
#
# Um padrao decide se a acao roda. Pode ser:
#   /regex/          casa contra $0
#   expressao        verdadeira/falsa (campos e variaveis)
#   combinacao       padrao1 && padrao2, padrao1 || padrao2, !padrao
#
# Execucao:  awk -f exemplo_3.awk

function emitir(rotulo) {
    printf "%-22s %s\n", rotulo, $0
}

BEGIN {
    dados = "2024-03-01 erro: disco cheio\n" \
            "2024-03-02 ok: backup concluido\n" \
            "2024-03-03 erro: timeout na rede\n" \
            "2024-03-04 aviso: memoria baixa"

    n = split(dados, linhas, "\n")
    for (i = 1; i <= n; i++) {
        $0 = linhas[i]
        NR = i

        if ($0 ~ /erro/)                emitir("casa /erro/:")
        if (NR % 2 == 0)                emitir("registro par:")
        if (NF > 3)                     emitir("NF > 3:")
        if ($1 >= "2024-03-03")         emitir("data >= 03-03:")
        if ($0 !~ /erro/ && NF >= 3)    emitir("sem erro e NF >= 3:")

        # match() devolve a posicao e preenche RSTART e RLENGTH
        if (match($0, /[0-9][0-9]:[0-9][0-9]/))
            printf "%-22s posicao %d, tamanho %d, trecho [%s]\n", \
                   "horario encontrado:", RSTART, RLENGTH, substr($0, RSTART, RLENGTH)
    }
    exit
}
