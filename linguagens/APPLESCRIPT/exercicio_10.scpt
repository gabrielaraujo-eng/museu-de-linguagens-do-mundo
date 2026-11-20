-- exercicio_10.applescript
-- Enunciado: procurar um valor em uma lista e devolver sua posição, ou zero
-- quando o valor não existir.
-- Solução: busca linear com repeat with contador e return antecipado.

on buscarPosicao(lista, alvo)
    repeat with i from 1 to (count of lista)
        if (item i of lista) = alvo then return i
    end repeat
    return 0
end buscarPosicao

set linguagens to {"ALGOL", "Lisp", "AppleScript", "Forth", "Smalltalk"}
set procuradas to {"Forth", "COBOL"}
set linhas to {}

repeat with cada in procuradas
    set alvo to contents of cada
    set posicao to buscarPosicao(linguagens, alvo)
    if posicao = 0 then
        set end of linhas to alvo & ": não encontrada"
    else
        set end of linhas to alvo & ": posição " & (posicao as text)
    end if
end repeat

set AppleScript's text item delimiters to return
set relatorio to linhas as text
set AppleScript's text item delimiters to ""

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 10"
log relatorio
