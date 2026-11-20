# exercicio_2.awk -- contar vogais e consoantes de uma frase
#
# Enunciado: para cada palavra da frase, informar quantas vogais e
# quantas consoantes ela tem, e o total geral.
# Resolucao: copia-se a palavra, apaga-se o que nao e letra com gsub,
# conta-se as vogais e obtem-se as consoantes por diferenca.
#
# Execucao:  awk -f exercicio_2.awk

BEGIN {
    frase = "O rato roeu a roupa do rei de Roma"

    n = split(frase, palavra, " ")
    tv = 0; tc = 0

    for (i = 1; i <= n; i++) {
        p = tolower(palavra[i])
        gsub(/[^a-z]/, "", p)              # so letras
        vogais = p
        nv = gsub(/[aeiou]/, "", vogais)   # gsub devolve o numero de trocas
        nc = length(p) - nv
        tv += nv; tc += nc
        printf "%-8s vogais=%d consoantes=%d\n", palavra[i], nv, nc
    }

    printf "total: %d vogais, %d consoantes, %d letras\n", tv, tc, tv + tc
    exit
}
