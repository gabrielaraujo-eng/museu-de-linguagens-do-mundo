#Requires AutoHotkey v2.0
; exemplo_7.ahk - tratamento de erros com try, catch, throw e finally
;
; Em v2 erros são objetos derivados da classe Error. A cláusula catch pode
; filtrar pela classe do erro: catch ValueError as e. O bloco finally roda
; sempre, com ou sem exceção.

; Exceção personalizada: basta herdar de Error.
class EstoqueInsuficiente extends Error {
}

Retirar(estoque, quantidade) {
    if (quantidade > estoque)
        throw EstoqueInsuficiente("Pedido de " quantidade " unidade(s); disponível: " estoque)
    return estoque - quantidade
}

try {
    MsgBox("Estoque restante: " Retirar(10, 4))
    MsgBox("Estoque restante: " Retirar(10, 15))   ; lança a exceção
    MsgBox("Esta linha não é executada.")
}
catch EstoqueInsuficiente as e {
    MsgBox("Erro de negócio: " e.Message)
}
catch Error as e {
    MsgBox("Erro genérico: " e.Message)
}
finally {
    MsgBox("O bloco finally sempre é executado.")
}

; Exceções embutidas: o próprio script lança ValueError quando o texto
; recebido não é um inteiro válido (verificado com RegExMatch).
ConverterIdade(texto) {
    if (!RegExMatch(Trim(texto), "^-?\d+$"))
        throw ValueError('"' texto '" não é um número inteiro.')
    return Integer(texto)
}

for entrada in ["30", "trinta"] {
    try {
        MsgBox("Idade aceita: " ConverterIdade(entrada))
    }
    catch ValueError as e {
        MsgBox("Entrada recusada: " e.Message)
    }
}
