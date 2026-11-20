-- exercicio_5.applescript
-- Enunciado: calcular uma potência inteira sem usar o operador ^.
-- Solução: handler com repeat n times; expoente zero devolve 1 e expoente
-- negativo é recusado com error.

on potencia(base, expoente)
    if expoente < 0 then error "expoente negativo não suportado" number 1002
    set resultado to 1
    repeat expoente times
        set resultado to resultado * base
    end repeat
    return resultado
end potencia

set base to 3
set expoente to 4
set resultado to potencia(base, expoente)

set relatorio to base & " elevado a " & expoente & " = " & resultado & return & ¬
    "conferência com ^: " & (base ^ expoente)

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 5"
log relatorio
