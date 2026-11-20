-- exemplo_2.applescript
-- Tópico: variáveis, classes de valores e coerção com o operador "as".

set contador to 0                 -- integer
set preco to 12.5                 -- real
set titulo to "AppleScript"       -- text
set ativo to true                 -- boolean
set vazio to missing value        -- missing value
set linguagens to {"AppleScript", "ALGOL", "Lisp"}   -- list
set ficha to {nome:"AppleScript", ano:1993, criador:"Apple"}   -- record

set contador to contador + 1
set preco to preco * 2
set classeDoPreco to (class of preco) as text
set classeDoContador to (class of contador) as text

-- A concatenação com & converte números em texto automaticamente.
set relatorio to "contador: " & contador & return & ¬
    "classe de contador: " & classeDoContador & return & ¬
    "preço: " & preco & return & ¬
    "classe de preço: " & classeDoPreco & return & ¬
    "itens da lista: " & (count of linguagens) & return & ¬
    "ano da ficha: " & (ano of ficha) & return & ¬
    "criador da ficha: " & (criador of ficha)

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 2"
log relatorio
