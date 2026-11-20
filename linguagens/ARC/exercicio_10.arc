; exercicio_10.arc: Estatísticas de uma turma (tema: algoritmos)
;
; Objetivo: a partir de uma lista de notas, calcular mínimo, máximo,
; soma, média inteira e mediana, devolvendo tudo como lista de associação.

(def estatisticas (xs)
  (let ord (sort < xs)
    (withs (n (len ord)
             soma (apply + ord)
             meio (trunc (/ n 2))
             mediana (if (even n)
                         (/ (+ (ord (- meio 1)) (ord meio)) 2)
                         (ord meio)))
      (list (list 'minimo (car ord))
            (list 'maximo (last ord))
            (list 'soma soma)
            (list 'media (trunc (/ soma n)))
            (list 'mediana mediana)))))

(= notas '(7 3 9 4 8 10))
(prn "notas: " notas)
(each par (estatisticas notas)
  (prn "  " (car par) ": " (cadr par)))

; A mesma função com quantidade ímpar de notas: a mediana é o valor central.
(= notas2 '(6 2 9 4 7))
(prn "notas: " notas2)
(each par (estatisticas notas2)
  (prn "  " (car par) ": " (cadr par)))

; Quantos alunos ficaram acima da média inteira.
(= media (alref (estatisticas notas) 'media))
(= acima 0)
(each n notas
  (when (> n media) (= acima (+ acima 1))))
(prn "acima da média (" media "): " acima " alunos")

; Contagem de aprovados com keep, filtrando a lista.
(prn "aprovados (nota maior ou igual a 6): " (keep [>= _ 6] notas))
