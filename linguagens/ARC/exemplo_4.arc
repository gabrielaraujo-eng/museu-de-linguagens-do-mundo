; exemplo_4.arc: Repetições (laços)
;
; Arc oferece while (teste no início), for (contagem numérica),
; each (percurso de sequências) e repeat (número fixo de repetições).

; while: repete enquanto o teste for verdadeiro.
(= i 0)
(while (< i 3)
  (prn "i = " i)
  (= i (+ i 1)))

; for: conta de init até max, inclusive nas duas pontas.
(= soma 0)
(for n 1 10
  (= soma (+ soma n)))
(prn "soma de 1 a 10: " soma)

; each percorre listas...
(each fruta '("maçã" "banana" "uva")
  (prn "fruta: " fruta))

; ...strings, entregando um caractere por vez...
(each letra "Arc"
  (prn "letra: " letra))

; ...e listas de associação, entregando cada par.
(each par '((a 1) (b 2))
  (prn "chave: " (car par) " valor: " (cadr par)))

; repeat executa o corpo n vezes; o valor é nil.
(repeat 5 (pr "="))
(prn)

; Acumulando com condição dentro do laço: push empilha no início.
(= pares nil)
(for n 1 20
  (when (even n) (push n pares)))
(prn "pares até 20, em ordem: " (rev pares))

; Laço aninhado: tabuada curta.
(for a 1 3
  (for b 1 3
    (pr (* a b) " "))
  (prn))
