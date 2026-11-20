# exercicio_4.awk -- inverter uma string e testar palindromo
#
# Enunciado: inverter uma palavra caractere a caractere e dizer se ela
# e um palindromo (igual ao proprio reverso, ignorando caixa e espacos).
# Resolucao: substr(s, i, 1) em laco decrescente; comparacao em minusculas.
#
# Execucao:  awk -f exercicio_4.awk

function inverte(s,   i, r) {
    r = ""
    for (i = length(s); i >= 1; i--)
        r = r substr(s, i, 1)
    return r
}

function normaliza(s) {
    s = tolower(s)
    gsub(/[^a-z]/, "", s)
    return s
}

BEGIN {
    teste[1] = "AWK"
    teste[2] = "arara"
    teste[3] = "A base do teto desaba"
    teste[4] = "linguagens"

    for (i = 1; i <= 4; i++) {
        original = teste[i]
        limpo = normaliza(original)
        reverso = inverte(limpo)
        printf "%-24s -> %-20s %s\n", original, reverso, \
               (limpo == reverso ? "palindromo" : "nao e palindromo")
    }
    exit
}
