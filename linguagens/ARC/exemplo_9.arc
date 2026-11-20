; exemplo_9.arc: Matemática
;
; As operações aritméticas de Arc são variádicas e trabalham com
; inteiros exatos e com racionais/reais (tipo num).

(prn "soma: " (+ 1 2 3 4))
(prn "produto: " (* 2 3 4))
(prn "subtração: " (- 10 3 2))
(prn "divisão exata: " (/ 10 4))
(prn "divisão truncada: " (trunc (/ 10 4)))
(prn "resto: " (mod 17 5))
(prn "expoente: " (expt 2 16))
(prn "raiz quadrada: " (sqrt 144))
(prn "valor absoluto: " (abs -9))
(prn "mínimo: " (min 3 9 2) " | máximo: " (max 3 9 2))
(prn "arredondamento: " (round 7.5) " e " (trunc 7.9))
(prn "par e ímpar: " (even 10) " " (odd 10))
(prn "comparações: " (< 1 2) " " (>= 2 2) " " (<= 3 2))

; Média aritmética de uma lista, sem e com arredondamento.
(def media (xs)
  (/ (apply + xs) (len xs)))

(= notas '(4 7 9))
(prn "média: " (media notas))
(prn "média truncada: " (trunc (media notas)))

; Somatório e produtório com acumuladores.
(= soma 0 produto 1)
(each n '(1 2 3 4 5)
  (= soma (+ soma n))
  (= produto (* produto n)))
(prn "somatório: " soma)
(prn "produtório: " produto)

; Números primos até 30 por divisão por tentativa.
(def primo? (n)
  (if (< n 2)
      nil
      (let divisor 2
        (while (and (<= (* divisor divisor) n) (isnt (mod n divisor) 0))
          (= divisor (+ divisor 1)))
        (> (* divisor divisor) n))))

(= primos nil)
(for n 2 30
  (when (primo? n) (push n primos)))
(prn "primos até 30: " (rev primos))
