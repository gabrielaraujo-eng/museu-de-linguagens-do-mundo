-- exercicio_9.applescript
-- Enunciado: calcular média, maior e menor de seis notas.
-- Solução: handler que devolve um record com os três valores.

on arredondar(valor, casas)
    set fator to 10 ^ casas
    return (round (valor * fator)) / fator
end arredondar

on estatisticas(lista)
    set maior to item 1 of lista
    set menor to item 1 of lista
    set total to 0
    repeat with cada in lista
        set valor to contents of cada
        set total to total + valor
        if valor > maior then set maior to valor
        if valor < menor then set menor to valor
    end repeat
    return {maior:maior, menor:menor, media:(total / (count of lista))}
end estatisticas

set notas to {6.5, 8, 9.25, 4, 10, 7.75}
set resultado to estatisticas(notas)

set relatorio to "notas: " & (count of notas) & return & ¬
    "maior: " & (maior of resultado) & return & ¬
    "menor: " & (menor of resultado) & return & ¬
    "média: " & (arredondar(media of resultado, 2))

display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 9"
log relatorio
