-- exemplo_5.applescript
-- Tópico: handlers (funções) com parâmetros posicionais, recursão e
-- parâmetro rotulado declarado com given.

on fatorial(n)
    if n ≤ 1 then return 1
    return n * fatorial(n - 1)
end fatorial

on mediaDe(lista)
    set total to 0
    repeat with cada in lista
        set total to total + (contents of cada)
    end repeat
    return total / (count of lista)
end mediaDe

on maiorDe(lista)
    set maior to item 1 of lista
    repeat with cada in lista
        set valor to contents of cada
        if valor > maior then set maior to valor
    end repeat
    return maior
end maiorDe

-- Parâmetro rotulado: quem chama usa given saudacao:valor.
to cumprimentar aPessoa given saudacao:frase
    return frase & ", " & aPessoa & "!"
end cumprimentar

set n to 6
set valores to {4, 8, 15, 16, 23, 42}
set frase to cumprimentar "Ana" given saudacao:"Bom dia"

set relatorio to "fatorial de " & n & ": " & (fatorial(n)) & return & ¬
    "média: " & (mediaDe(valores)) & return & ¬
    "maior: " & (maiorDe(valores)) & return & ¬
    "cumprimento: " & frase

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 5"
log relatorio
