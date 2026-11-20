# exemplo_2.awk -- registros e campos: $0, $1, $NF, NF e NR
#
# $0  e o registro inteiro; $1.. $NF sao os campos;
# NF  e o numero de campos do registro atual;
# NR  e o numero do registro lido desde o inicio.
# Aqui os registros vem de uma string embutida, desmembrada com split.
#
# Execucao:  awk -f exemplo_2.awk

function mostra(   i) {
    printf "NR=%d NF=%d | $1=[%s] | $NF=[%s]\n", NR, NF, $1, $NF
    for (i = 1; i <= NF; i++)
        printf "    campo %d = %s\n", i, $i
}

BEGIN {
    dados = "Ana 31 analista\n" \
            "Bruno 27 desenvolvedor backend\n" \
            "Carla 45 gerente de projetos"

    n = split(dados, linhas, "\n")
    for (i = 1; i <= n; i++) {
        $0 = linhas[i]   # atribuir $0 refaz o desmembramento e ajusta NF
        NR = i           # mantemos NR coerente com o registro simulado
        mostra()
    }

    # campo inexistente e a string vazia, nao um erro
    printf "campo 9 do ultimo registro = [%s]\n", $9

    # mudar OFS so afeta a saida de print com varios argumentos
    OFS = " | "
    print $1, $2, $3
    exit
}
