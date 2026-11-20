-- exemplo_8.applescript
-- Tópico: manipulação de texto, text items e text item delimiters.

set frase to "AppleScript é uma linguagem de script"
set totalDeCaracteres to count of frase
set palavras to words of frase
set posicao to offset of "linguagem" in frase      -- 19 (1 = primeiro caractere)
set trecho to text 1 thru 11 of frase              -- "AppleScript"

-- Juntar os itens de uma lista em um único texto.
set AppleScript's text item delimiters to " | "
set palavrasJuntas to palavras as text
set AppleScript's text item delimiters to ""

-- Separar um texto em itens, usando a vírgula como delimitador.
set AppleScript's text item delimiters to ","
set partes to text items of "um,dois,três"
set AppleScript's text item delimiters to ""

-- Por padrão a comparação de texto ignora diferenças de caixa.
set igualSemCaixa to ("Lisp" = "lisp")
considering case
    set igualComCaixa to ("Lisp" = "lisp")
end considering

set relatorio to "caracteres: " & totalDeCaracteres & return & ¬
    "palavras: " & (count of palavras) & return & ¬
    "posição de linguagem: " & posicao & return & ¬
    "trecho: " & trecho & return & ¬
    "juntas: " & palavrasJuntas & return & ¬
    "partes: " & (count of partes) & " itens, o segundo é " & (item 2 of partes) & return & ¬
    "Lisp = lisp sem considerar caixa: " & igualSemCaixa & return & ¬
    "Lisp = lisp considerando caixa: " & igualComCaixa

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 8"
log relatorio
