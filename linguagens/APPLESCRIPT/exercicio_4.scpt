-- exercicio_4.applescript
-- Enunciado: somar os números pares de 1 a 20 e contar quantos são.
-- Solução: repeat with de 1 a 20 e teste com o operador mod.

set soma to 0
set quantidade to 0

repeat with i from 1 to 20
    if i mod 2 = 0 then
        set soma to soma + i
        set quantidade to quantidade + 1
    end if
end repeat

set relatorio to "pares entre 1 e 20: " & quantidade & return & ¬
    "soma dos pares: " & soma
display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 4"
log relatorio
