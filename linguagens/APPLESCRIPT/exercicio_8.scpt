-- exercicio_8.applescript
-- Enunciado: contar as palavras de uma frase e devolver as palavras na ordem
-- inversa, separadas por espaço.
-- Solução: elemento words, repeat decrescente e text item delimiters.

set frase to "o rato roeu a roupa do rei de roma"
set palavras to words of frase
set quantidade to count of palavras

set invertidas to {}
repeat with i from quantidade to 1 by -1
    set end of invertidas to item i of palavras
end repeat

set AppleScript's text item delimiters to " "
set fraseInvertida to invertidas as text
set AppleScript's text item delimiters to ""

-- Maior palavra, medida por número de caracteres.
set maiorPalavra to item 1 of palavras
repeat with cada in palavras
    set palavra to contents of cada
    if (count of palavra) > (count of maiorPalavra) then set maiorPalavra to palavra
end repeat

set relatorio to "frase: " & frase & return & ¬
    "palavras: " & quantidade & return & ¬
    "ordem inversa: " & fraseInvertida & return & ¬
    "maior palavra: " & maiorPalavra

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 8"
log relatorio
