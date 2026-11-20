-- exercicio_7.applescript
-- Enunciado: dividir dois números recusando divisor zero sem interromper o
-- script.
-- Solução: error com número próprio dentro de try / on error.

on dividirSeguro(a, b)
    try
        if b = 0 then error "o divisor não pode ser zero" number 1001
        return a / b
    on error mensagem number codigo
        return "falha " & (codigo as text) & ": " & mensagem
    end try
end dividirSeguro

set casos to {{10, 2}, {9, 3}, {7, 0}}
set linhas to {}

repeat with cada in casos
    set par to contents of cada
    set a to item 1 of par
    set b to item 2 of par
    set end of linhas to (a as text) & " / " & (b as text) & " = " & dividirSeguro(a, b)
end repeat

set AppleScript's text item delimiters to return
set relatorio to linhas as text
set AppleScript's text item delimiters to ""

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 7"
log relatorio
