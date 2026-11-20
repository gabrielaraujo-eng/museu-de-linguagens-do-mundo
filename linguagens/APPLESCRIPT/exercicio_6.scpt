-- exercicio_6.applescript
-- Enunciado: inverter a ordem de uma lista de cinco itens sem usar reverse.
-- Solução: repeat with contador decrescente (by -1) e set end of.

set original to {"a", "b", "c", "d", "e"}
set invertida to {}

repeat with i from (count of original) to 1 by -1
    set end of invertida to item i of original
end repeat

on listaComoTexto(lista)
    set AppleScript's text item delimiters to ", "
    set resultado to lista as text
    set AppleScript's text item delimiters to ""
    return resultado
end listaComoTexto

set relatorio to "original: " & listaComoTexto(original) & return & ¬
    "invertida: " & listaComoTexto(invertida) & return & ¬
    "primeiro item da invertida: " & (item 1 of invertida)

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 6"
log relatorio
