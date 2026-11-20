; exercicio_3.arc: Classificação de um número (tema: controle de fluxo)
;
; Objetivo: classificar inteiros em negativo, zero, positivo pequeno
; (até 9) e positivo grande, usando if com várias vias, when e unless.

(def classifica (n)
  (if (not-a-number n)
      "não numérico"
      (< n 0)  "negativo"
      (is n 0) "zero"
      (< n 10) "positivo pequeno"
               "positivo grande"))

(def not-a-number (x)
  (no (number x)))

(each n '(-3 0 4 42)
  (prn n " -> " (classifica n)))

; Aviso emitido apenas quando o número é negativo (when) e confirmação
; emitida quando ele não é negativo (unless).
(each n '(-3 7)
  (when (< n 0)
    (prn "atenção: " n " é negativo"))
  (unless (< n 0)
    (prn "ok: " n " não é negativo")))

; case com as três faixas, comparando por igualdade de símbolo.
(each n '(-3 0 4)
  (case n
    0 (prn "case: zero exato")
    (prn "case: valor diferente de zero: " n)))
