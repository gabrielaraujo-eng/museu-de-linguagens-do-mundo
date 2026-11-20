-- exemplo_3.applescript
-- Tópico: controle de fluxo com if, else if e else.

set temperatura to 27
set avaliacao to ""
set sugestao to "trabalho"
set alerta to "nenhum"

if temperatura < 15 then
    set avaliacao to "frio"
else if temperatura < 25 then
    set avaliacao to "agradável"
else if temperatura < 32 then
    set avaliacao to "quente"
else
    set avaliacao to "muito quente"
end if

-- Os operadores lógicos and, or e not combinam expressões booleanas.
set fimDeSemana to true
if temperatura >= 25 and fimDeSemana then
    set sugestao to "praia"
end if

-- Forma de uma linha, sem bloco: só uma instrução depois de then.
if temperatura > 30 then set alerta to "beber água"

-- Comparações também podem ser escritas por extenso.
if avaliacao is equal to "quente" then
    set comentario to "use camiseta leve"
else
    set comentario to "verifique a previsão"
end if

set relatorio to "temperatura: " & temperatura & return & ¬
    "avaliação: " & avaliacao & return & ¬
    "sugestão: " & sugestao & return & ¬
    "alerta: " & alerta & return & ¬
    "comentário: " & comentario

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 3"
log relatorio
