# exercicio_7.awk -- validacao de cadastro com codigo de saida
#
# Enunciado: validar registros "nome;idade;email" e recusar os invalidos:
# nome vazio, idade fora de 0..120 ou e-mail sem "@".
# Resolucao: funcao valida() que devolve o numero do erro; mensagens em
# /dev/stderr; exit 1 se algum registro for recusado.
#
# Execucao:  awk -f exercicio_7.awk
#            awk -v estrito=1 -f exercicio_7.awk
# Codigo de saida: 0 por padrao; com -v estrito=1 devolve 1 se algum
# registro for recusado.

function valida(nome, idade, email,   n) {
    if (nome == "")                       return 1
    if (idade !~ /^[0-9]+$/)              return 2
    n = idade + 0
    if (n < 0 || n > 120)                 return 3
    if (index(email, "@") == 0)           return 4
    return 0
}

function motivo(codigo) {
    if (codigo == 1) return "nome vazio"
    if (codigo == 2) return "idade nao numerica"
    if (codigo == 3) return "idade fora de 0..120"
    if (codigo == 4) return "email sem @"
    return "ok"
}

BEGIN {
    registro[1] = "Ana;31;ana@exemplo.br"
    registro[2] = ";22;sem-nome@exemplo.br"
    registro[3] = "Bruno;abc;bruno@exemplo.br"
    registro[4] = "Carla;150;carla@exemplo.br"
    registro[5] = "Davi;40;davi.exemplo.br"
    registro[6] = "Elisa;0;elisa@exemplo.br"

    FS = ";"
    validos = 0; recusados = 0

    for (i = 1; i <= 6; i++) {
        $0 = registro[i]                  # FS=";" desmembra em $1,$2,$3
        codigo = valida($1, $2, $3)
        if (codigo == 0) {
            validos++
            printf "OK      %-6s idade=%-3d %s\n", $1, $2, $3
        } else {
            recusados++
            printf "RECUSADO linha %d: %s (%s)\n", i, $0, motivo(codigo) > "/dev/stderr"
        }
    }

    printf "\nvalidos=%d recusados=%d\n", validos, recusados
    exit (estrito + 0 > 0 && recusados > 0)
}
