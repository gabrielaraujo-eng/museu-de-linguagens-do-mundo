; exemplo_5.arc: Funções
;
; (def nome (parâmetros) corpo...) define uma função global.
; O corpo é uma sequência implícita de expressões: o valor é o da última.
; Parâmetros especiais:
;   (o nome padrão)  -> argumento opcional com valor padrão
;   nome solto       -> recebe todos os argumentos restantes em uma lista

(def quadrado (x) (* x x))

(def media (a b)
  (prn "calculando a média de " a " e " b)
  (/ (+ a b) 2))

(def potencia (base (o expoente 2))
  (expt base expoente))

(def soma-tudo args
  (apply + args))

; Recursão: não há laço interno, a própria função se chama.
(def fatorial (n)
  (if (< n 2)
      1
      (* n (fatorial (- n 1)))))

(prn "quadrado de 7: " (quadrado 7))
(prn "média: " (media 4 10))
(prn "potência com padrão: " (potencia 3))
(prn "potência explícita: " (potencia 2 10))
(prn "soma variádica: " (soma-tudo 1 2 3 4 5))
(prn "10!: " (fatorial 10))

; fn cria uma função anônima, útil como argumento de outra função.
(prn "função anônima: " ((fn (a b) (+ a b)) 3 4))
(prn "map com quadrado: " (map quadrado '(1 2 3 4)))
(prn "map com anônima: " (map (fn (n) (* n 10)) '(1 2 3)))

; Funções são valores: podem ser guardadas em variáveis.
(= dobro quadrado)
(prn "função guardada em variável: " (dobro 6))
