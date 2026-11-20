-- exemplo_7.applescript
-- Tópico: tratamento de erros com try, on error e a instrução error.

-- error interrompe a execução e pode levar uma mensagem e um número.
on dividir(a, b)
    if b = 0 then error "divisão por zero" number 1001
    return a / b
end dividir

-- try protege um bloco; on error captura mensagem e número do erro.
on dividirComProtecao(a, b)
    try
        return dividir(a, b)
    on error mensagem number codigo
        return "erro " & (codigo as text) & ": " & mensagem
    end try
end dividirComProtecao

set caso1 to dividirComProtecao(10, 4)   -- devolve 2.5
set caso2 to dividirComProtecao(10, 0)   -- devolve "erro 1001: divisão por zero"

-- Erros levantados pelo próprio AppleScript também são capturados.
-- O número e o texto variam conforme a versão e o idioma do sistema.
try
    set resultado to "texto" + 1
on error mensagem number codigo
    set caso3 to "erro " & (codigo as text) & ": " & mensagem
end try

set relatorio to "10 / 4 = " & caso1 & return & ¬
    "10 / 0 = " & caso2 & return & ¬
    "soma inválida: " & caso3

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 7"
log relatorio
