; exercicio_4.arc: Soma dos números pares (tema: repetições)
;
; Objetivo: somar os pares de 1 a 50 de duas maneiras (for e while) e
; comparar os resultados; contar também quantos múltiplos de 7 existem
; no intervalo.

; Versão 1: for com filtro por even.
(= soma-for 0)
(for n 1 50
  (when (even n)
    (= soma-for (+ soma-for n))))
(prn "soma dos pares (for): " soma-for)

; Versão 2: while com contador manual.
(= i 1 soma-while 0)
(while (<= i 50)
  (when (even i)
    (= soma-while (+ soma-while i)))
  (= i (+ i 1)))
(prn "soma dos pares (while): " soma-while)
(prn "as duas versões concordam? " (is soma-for soma-while))

; Múltiplos de 7 no mesmo intervalo, guardados em lista.
(= multiplos nil)
(for n 1 50
  (when (is (mod n 7) 0)
    (push n multiplos)))
(prn "múltiplos de 7: " (rev multiplos))
(prn "quantidade: " (len multiplos))

; repeat apenas para desenhar a linha de fecho.
(repeat 20 (pr "-"))
(prn)
