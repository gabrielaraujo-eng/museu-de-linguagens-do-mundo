-- exercicio_3.applescript
-- Enunciado: classificar cada número de uma lista como positivo, negativo ou
-- zero.
-- Solução: handler com if / else if / else, chamado dentro de um repeat.

on classificar(numero)
    if numero > 0 then
        return "positivo"
    else if numero < 0 then
        return "negativo"
    else
        return "zero"
    end if
end classificar

set valores to {12, -5, 0, 7, -1}
set linhas to {}

repeat with cada in valores
    set numero to contents of cada
    set end of linhas to (numero as text) & " é " & classificar(numero)
end repeat

set AppleScript's text item delimiters to return
set relatorio to linhas as text
set AppleScript's text item delimiters to ""

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 3"
log relatorio
