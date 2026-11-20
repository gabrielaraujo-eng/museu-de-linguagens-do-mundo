; exemplo_10.arc: Algoritmos
;
; Ordenação por inserção escrita à mão, a ordenação nativa sort,
; busca binária recursiva e Fibonacci com memoização em tabela.

(def insere (x xs)
  (if (no xs)
      (list x)
      (<= x (car xs))
      (cons x xs)
      (cons (car xs) (insere x (cdr xs)))))

(def ordena (xs)
  (if (no xs)
      nil
      (insere (car xs) (ordena (cdr xs)))))

(= dados '(5 2 9 1 7))
(prn "dados: " dados)
(prn "ordenação por inserção: " (ordena dados))
(prn "sort nativo (crescente): " (sort < dados))
(prn "sort nativo (decrescente): " (sort > dados))

; Busca binária: a lista precisa estar ordenada.
; Parâmetros opcionais guardam os limites inferior e superior.
(def busca (alvo v (o lo 0) (o hi nil))
  (let hi (if (no hi) (- (len v) 1) hi)
    (if (> lo hi)
        nil
        (withs (meio (trunc (/ (+ lo hi) 2))
                 atual (v meio))
          (if (is atual alvo)
              meio
              (< alvo atual)
              (busca alvo v lo (- meio 1))
              (busca alvo v (+ meio 1) hi))))))

(= ordenado (list 1 3 5 7 9 11))
(prn "busca do valor 7: índice " (busca 7 ordenado))
(prn "busca do valor 4: " (busca 4 ordenado))

; Fibonacci com memoização: a tabela evita recalcular subproblemas.
(= memo-fib (table))
(def fib (n)
  (iflet guardado (memo-fib n)
    guardado
    (let r (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2))))
      (= (memo-fib n) r)
      r)))
(prn "fib(20) = " (fib 20))
(prn "fib(40) = " (fib 40))
