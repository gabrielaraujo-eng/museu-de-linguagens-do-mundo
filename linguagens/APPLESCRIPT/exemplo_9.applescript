-- exemplo_9.applescript
-- Tópico: operadores e comandos matemáticos.

set base to 2
set expoente to 10
set potencia to base ^ expoente          -- 1024
set quociente to 17 div 5                -- 3 (divisão inteira)
set resto to 17 mod 5                    -- 2
set raiz to 81 ^ 0.5                     -- 9.0

-- round é um comando das Standard Additions; aceita o parâmetro rounding.
set meioParaCima to round 2.5 rounding as taught in school   -- 3
set truncado to round 2.7 rounding toward zero               -- 2

on valorAbsoluto(x)
    if x < 0 then return -x
    return x
end valorAbsoluto

on arredondar(valor, casas)
    set fator to 10 ^ casas
    return (round (valor * fator)) / fator
end arredondar

set diferenca to valorAbsoluto(12 - 30)              -- 18
set piAproximado to arredondar(22 / 7, 4)            -- 3.1429
set mediaSimples to arredondar((4 + 9 + 15) / 3, 2)  -- 9.33

set relatorio to base & " ^ " & expoente & " = " & potencia & return & ¬
    "17 div 5 = " & quociente & " e 17 mod 5 = " & resto & return & ¬
    "raiz de 81 = " & raiz & return & ¬
    "round 2.5 = " & meioParaCima & " e round 2.7 = " & truncado & return & ¬
    "valor absoluto de -18 = " & diferenca & return & ¬
    "22/7 arredondado = " & piAproximado & return & ¬
    "média arredondada = " & mediaSimples

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 9"
log relatorio
