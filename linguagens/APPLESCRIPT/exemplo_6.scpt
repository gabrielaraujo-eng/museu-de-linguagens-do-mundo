-- exemplo_6.applescript
-- Tópico: listas (list) e registros (record) como estruturas de dados.

set notas to {7.5, 9, 4.25, 10, 6}
set quantidade to count of notas
set primeira to item 1 of notas
set ultima to item -1 of notas          -- índice negativo conta do fim
set tresPrimeiras to items 1 thru 3 of notas

-- & concatena listas; set end of acrescenta um item no fim.
set ampliada to notas & {8}
set end of ampliada to 5.5

-- Records são valores imutáveis: para "alterar" um campo cria-se outro record.
set aluno to {nome:"Ana", notas:notas, aprovado:false}
set nomeDoAluno to nome of aluno
set alunoAtualizado to aluno & {aprovado:true}
set aprovadoFinal to (aprovado of alunoAtualizado) as text

-- text item delimiters controla como uma lista é convertida em texto.
set AppleScript's text item delimiters to ", "
set notasComoTexto to notas as text
set ampliadaComoTexto to ampliada as text
set tresPrimeirasComoTexto to tresPrimeiras as text
set AppleScript's text item delimiters to ""

set relatorio to "quantidade: " & quantidade & return & ¬
    "primeira: " & primeira & return & ¬
    "última: " & ultima & return & ¬
    "três primeiras: " & tresPrimeirasComoTexto & return & ¬
    "notas: " & notasComoTexto & return & ¬
    "lista ampliada: " & ampliadaComoTexto & return & ¬
    "aluno: " & nomeDoAluno & " — aprovado? " & aprovadoFinal

display dialog relatorio buttons {"OK"} default button "OK" with title "Exemplo 6"
log relatorio
