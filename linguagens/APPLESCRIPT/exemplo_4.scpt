-- exemplo_4.applescript
-- Tópico: as quatro formas do laço repeat e a instrução exit repeat.

-- 1) repeat com contador, de um valor inicial até um valor final.
set soma to 0
repeat with i from 1 to 10
    set soma to soma + i
end repeat
--> 55

-- 2) repeat n times: repete um número fixo de vezes.
set produto to 1
repeat 5 times
    set produto to produto * 2
end repeat
--> 32

-- 3) repeat while: testa a condição antes de cada volta.
-- Sequência de Collatz a partir de 27: termina sempre em 1.
set n to 27
set passos to 0
repeat while n ≠ 1
    if n mod 2 = 0 then
        set n to n div 2
    else
        set n to 3 * n + 1
    end if
    set passos to passos + 1
end repeat
--> 111 passos

-- 4) repeat com lista e exit repeat para interromper a busca.
set alvo to "Lisp"
set posicao to 0
set indice to 0
repeat with cada in {"ALGOL", "Lisp", "AppleScript"}
    set indice to indice + 1
    if (contents of cada) = alvo then
        set posicao to indice
        exit repeat
    end if
end repeat

set relatorio to "soma de 1 a 10: " & soma & return & ¬
    "produto de cinco dobras: " & produto & return & ¬
    "passos de Collatz: " & passos & return & ¬
    alvo & " está na posição " & posicao

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 4"
log relatorio
