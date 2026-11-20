# exemplo_5.awk -- funcoes definidas pelo usuario
#
# Sintaxe: function nome(parametro1, parametro2) { ... return valor }
# A funcao precisa ser definida no nivel superior do programa (fora de regras).
# Parametros extras, separados por virgula, sao convencao para variaveis locais:
# em awk todo parametro nao usado na chamada comeca vazio.
#
# Execucao:  awk -f exemplo_5.awk

# fatorial recursivo
function fatorial(n) {
    if (n <= 1)
        return 1
    return n * fatorial(n - 1)
}

# maximo entre dois numeros
function maior(a, b) {
    return (a > b) ? a : b
}

# media de um array numerico passado por referencia; "i" e local
function media(arr, qtd,   i, soma) {
    soma = 0
    for (i = 1; i <= qtd; i++)
        soma += arr[i]
    return qtd > 0 ? soma / qtd : 0
}

# funcao sem return devolve a string vazia
function aviso(texto) {
    printf "[aviso] %s\n", texto
}

BEGIN {
    printf "5! = %d\n", fatorial(5)
    printf "10! = %d\n", fatorial(10)
    printf "maior(3.5, 2.75) = %.2f\n", maior(3.5, 2.75)

    nota[1] = 7.5; nota[2] = 9; nota[3] = 6.5; nota[4] = 8
    printf "media das 4 notas = %.3f\n", media(nota, 4)

    aviso("funcao chamada com sucesso")
    exit
}
