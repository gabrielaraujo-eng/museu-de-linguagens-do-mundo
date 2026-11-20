# exemplo_8.awk -- funcoes de string
#
# length(s), substr(s, m [, n]), index(s, t), toupper/tolower,
# sub(re, sub) e gsub(re, sub) alteram a variavel de destino,
# split(s, arr, re), sprintf(fmt, ...) devolve string formatada.
#
# Execucao:  awk -f exemplo_8.awk

BEGIN {
    s = "  Museu de Linguagens do Mundo  "
    printf "original   : [%s] (length=%d)\n", s, length(s)

    t = s
    gsub(/^ +| +$/, "", t)              # gsub troca todas as ocorrencias
    printf "sem espacos: [%s] (length=%d)\n", t, length(t)

    printf "substr(t,1,5)  = [%s]\n", substr(t, 1, 5)
    printf "substr(t,7)    = [%s]\n", substr(t, 7)
    printf "substr(t,7,3)  = [%s]\n", substr(t, 7, 3)
    printf "index(t,\"de\")  = %d\n", index(t, "de")
    printf "toupper(t)     = %s\n", toupper(t)

    u = t
    n = sub(/Mundo/, "AWK", u)          # sub troca apenas a primeira
    printf "sub -> [%s] (%d troca)\n", u, n

    v = t
    n = gsub(/[aeiouAEIOU]/, "*", v)
    printf "gsub vogais -> [%s] (%d trocas)\n", v, n

    # split com expressao regular e com string literal
    m = split("2024-03-01", data, "-")
    printf "split por '-': %d partes -> %s / %s / %s\n", m, data[1], data[2], data[3]

    m = split("a:b;c d", partes, /[:; ]/)
    printf "split por regex: %d partes ->", m
    for (i = 1; i <= m; i++)
        printf " [%s]", partes[i]
    print ""

    printf "sprintf: |%8.2f|%-8s|%05d|\n", 3.14159, "ok", 42
    exit
}
