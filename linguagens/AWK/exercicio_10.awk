# exercicio_10.awk -- extrair e contar dominios de e-mails
#
# Enunciado: de uma lista de e-mails, extrair o dominio (parte apos o
# ultimo "@"), contar quantos e-mails cada dominio tem e listar ordenado.
# Resolucao: split() por "@" para o dominio, array associativo para a
# contagem, copia das chaves para ordenar por selecao.
#
# Execucao:  awk -f exercicio_10.awk

BEGIN {
    emails = "ana@exemplo.br bruno@exemplo.br carla@universidade.edu " \
             "davi@empresa.com elisa@universidade.edu fabio@exemplo.br " \
             "gabi@ong.org"

    n = split(emails, lista, " ")

    for (i = 1; i <= n; i++) {
        partes = split(lista[i], campo, "@")
        if (partes < 2 || campo[2] == "") {
            printf "aviso: [%s] nao tem dominio\n", lista[i] > "/dev/stderr"
            continue
        }
        dominio = campo[2]
        cont[dominio]++
        total++
    }

    m = 0
    for (d in cont)
        chave[++m] = d
    for (i = 1; i <= m; i++) {
        menor = i
        for (j = i + 1; j <= m; j++)
            if (chave[j] < chave[menor])
                menor = j
        if (menor != i) {
            t = chave[i]; chave[i] = chave[menor]; chave[menor] = t
        }
    }

    printf "e-mails lidos: %d\n", n
    printf "dominios distintos: %d\n\n", m
    printf "%-20s %s\n", "dominio", "quantidade"
    for (i = 1; i <= m; i++)
        printf "%-20s %d\n", chave[i], cont[chave[i]]
    exit
}
