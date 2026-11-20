# exemplo_7.awk -- validacao e tratamento de erros
#
# AWK nao tem excecoes. O padrao e:
#   - funcao que devolve um valor sentinela (aqui -1) quando o dado e invalido;
#   - mensagem de erro em /dev/stderr, para nao se misturar com a saida normal;
#   - exit N para sinalizar falha ao shell (N != 0).
# getline devolve 1 com registro lido, 0 no fim e -1 em erro de abertura.
#
# Execucao:  awk -f exemplo_7.awk
#            awk -v estrito=1 -f exemplo_7.awk
# Codigo de saida: 0 por padrao; com -v estrito=1 devolve 1 se houver
# registro invalido, que e o uso tipico em scripts de verificacao.

function converte_metros(s,   v) {
    if (s !~ /^-?[0-9]+(\.[0-9]+)?$/)
        return -1                       # nao e numero
    v = s + 0
    if (v < 0)
        return -1                       # comprimento negativo
    return v
}

function erro(msg) {
    printf "erro: %s\n", msg > "/dev/stderr"
}

BEGIN {
    cmd = "printf '12.5\\n3\\nabc\\n-4\\n7.25\\n'"
    soma = 0; bons = 0; ruins = 0; lidos = 0

    while ((cmd | getline linha) > 0) {
        lidos++
        v = converte_metros(linha)
        if (v < 0) {
            erro(sprintf("registro %d invalido: [%s]", lidos, linha))
            ruins++
            continue
        }
        soma += v
        bons++
    }
    close(cmd)

    if (lidos == 0) {
        erro("nenhum registro lido")
        exit 1
    }

    printf "lidos=%d validos=%d invalidos=%d\n", lidos, bons, ruins
    printf "soma dos validos = %.2f\n", soma

    if (ruins > 0) {
        print "conclusao: houve registros invalidos"
        exit (estrito + 0 > 0)      # so falha o script no modo estrito
    }
    print "conclusao: todos os registros sao validos"
    exit 0
}
