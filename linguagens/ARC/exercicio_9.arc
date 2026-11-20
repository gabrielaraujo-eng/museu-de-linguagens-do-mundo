; exercicio_9.arc: MDC e MMC (tema: matemática)
;
; Objetivo: calcular o máximo divisor comum pelo algoritmo de Euclides e,
; a partir dele, o mínimo múltiplo comum de vários pares de números.

(def mdc (a b)
  (if (is b 0)
      a
      (mdc b (mod a b))))

(def mmc (a b)
  (trunc (/ (* a b) (mdc a b))))

(prn "mdc(48, 18) = " (mdc 48 18))
(prn "mmc(4, 6) = " (mmc 4 6))

(each par '((12 8) (7 5) (100 75) (13 17))
  (prn "mdc(" (car par) ", " (cadr par) ") = " (mdc (car par) (cadr par))
       " | mmc = " (mmc (car par) (cadr par))))

; Reduzindo uma lista de números ao mdc e ao mmc de todos eles.
(def mdc-lista (xs (o acc 0))
  (if (no xs)
      acc
      (mdc-lista (cdr xs) (mdc acc (car xs)))))

(def mmc-lista (xs (o acc 1))
  (if (no xs)
      acc
      (mmc-lista (cdr xs) (mmc acc (car xs)))))

(= numeros '(12 18 24))
(prn "mdc de " numeros ": " (mdc-lista numeros))
(prn "mmc de " numeros ": " (mmc-lista numeros))

; Conferência: o produto do mdc pelo mmc de dois números é o produto deles.
(prn "mdc * mmc = a * b? "
     (is (* (mdc 48 18) (mmc 48 18)) (* 48 18)))
