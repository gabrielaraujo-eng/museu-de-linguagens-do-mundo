-- exemplo_10.applescript
-- Tópico: algoritmo completo — ordenação por inserção de uma lista.
-- A lista original não é alterada: o handler trabalha sobre uma cópia.

on copiarLista(lista)
    set copia to {}
    repeat with cada in lista
        set end of copia to contents of cada
    end repeat
    return copia
end copiarLista

on ordenarPorInsercao(lista)
    set copia to copiarLista(lista)
    repeat with i from 2 to (count of copia)
        set chave to item i of copia
        set j to i - 1
        repeat while j ≥ 1
            if (item j of copia) ≤ chave then exit repeat
            set item (j + 1) of copia to item j of copia
            set j to j - 1
        end repeat
        set item (j + 1) of copia to chave
    end repeat
    return copia
end ordenarPorInsercao

on listaComoTexto(lista)
    set AppleScript's text item delimiters to ", "
    set resultado to lista as text
    set AppleScript's text item delimiters to ""
    return resultado
end listaComoTexto

set original to {42, 7, 19, 3, 88, 15, 4}
set ordenada to ordenarPorInsercao(original)

set relatorio to "original: " & listaComoTexto(original) & return & ¬
    "ordenada: " & listaComoTexto(ordenada) & return & ¬
    "menor: " & (item 1 of ordenada) & return & ¬
    "maior: " & (item -1 of ordenada)

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 10"
log relatorio
