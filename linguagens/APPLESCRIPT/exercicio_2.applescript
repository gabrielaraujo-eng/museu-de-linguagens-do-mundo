-- exercicio_2.applescript
-- Enunciado: converter uma temperatura de Celsius para Fahrenheit e mostrar
-- o resultado com uma casa decimal.
-- Solução: F = C * 9 / 5 + 32, com arredondamento feito por um handler.

on arredondar(valor, casas)
    set fator to 10 ^ casas
    return (round (valor * fator)) / fator
end arredondar

on celsiusParaFahrenheit(graus)
    return graus * 9 / 5 + 32
end celsiusParaFahrenheit

set celsius to 37
set fahrenheit to celsiusParaFahrenheit(celsius)
set fahrenheitArredondado to arredondar(fahrenheit, 1)

set relatorio to celsius & " °C equivalem a " & fahrenheitArredondado & " °F"
display dialog relatorio buttons {"OK"} default button "OK" with title "Exercício 2"
log relatorio
