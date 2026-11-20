#Requires AutoHotkey v2.0
; exemplo_5.ahk - funções: parâmetros, valores padrão, variádicos e recursão
;
; A definição em v2 é "Nome(parametros) { ... }", com chaves obrigatórias.
; Funções precisam ser chamadas com parênteses; não existe o comando v1
; "Gosub" nem rótulos para funções.

Somar(a, b) {
    return a + b
}

; Parâmetro com valor padrão: usado quando o argumento é omitido.
Saudacao(nome, tratamento := "Sr.") {
    return "Bom dia, " tratamento " " nome "!"
}

; Parâmetro variádico (numeros*) recebe os demais argumentos como Array.
Media(numeros*) {
    if (numeros.Length = 0)
        return 0
    total := 0
    for n in numeros
        total += n
    return total / numeros.Length
}

; Parâmetro por referência: a função altera a variável do chamador.
Dobrar(&valor) {
    valor *= 2
}

; Recursão: a função chama a si mesma.
Fatorial(n) {
    if (n <= 1)
        return 1
    return n * Fatorial(n - 1)
}

; Função de uma linha com sintaxe de seta (arrow function).
AoQuadrado(x) => x ** 2

MsgBox("Somar(2, 3) = " Somar(2, 3))
MsgBox(Saudacao("Maria"))
MsgBox(Saudacao("João", "Dr."))
MsgBox("Média de 4, 8, 10 e 6 = " Format("{:.2f}", Media(4, 8, 10, 6)))

x := 21
Dobrar(&x)
MsgBox("Depois de Dobrar(&x), x = " x)

MsgBox("5! = " Fatorial(5) "`n9 ao quadrado = " AoQuadrado(9))
