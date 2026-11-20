; exercicio_1.arc: Saída formatada (tema: Olá, Mundo / impressão)
;
; Objetivo: imprimir um cabeçalho de três linhas, uma tabela de duas
; colunas alinhadas por espaços e uma linha de fecho.
; Pratique pr (sem quebra de linha) e prn (com quebra de linha).

(prn "========================")
(prn "  Acervo do Museu")
(prn "========================")

; Cabeçalho da tabela, montado com pr para não quebrar a linha.
(pr "Linguagem")
(pr "      ")
(prn "Ano")

(pr "Arc")
(pr "            ")
(prn 2001)

(pr "Lisp")
(pr "           ")
(prn 1958)

(prn "------------------------")
(prn "Total de linguagens: " 2)
(prn "Fim do relatório.")
