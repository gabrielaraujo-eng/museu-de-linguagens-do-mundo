; exercicio_6.arc: Listas: inverter e contar ocorrências
;
; Objetivo: inverter uma lista sem usar rev (recursão com acumulador),
; contar quantas vezes um valor aparece e montar uma tabela de
; frequências com chaves numéricas.

(def inverte (xs (o acc nil))
  (if (no xs)
      acc
      (inverte (cdr xs) (cons (car xs) acc))))

(def conta (alvo xs (o n 0))
  (if (no xs)
      n
      (conta alvo
             (cdr xs)
             (if (iso alvo (car xs)) (+ n 1) n))))

(= xs '(1 2 3 2 4 2))
(prn "lista original: " xs)
(prn "invertida: " (inverte xs))
(prn "confere com rev? " (iso (inverte xs) (rev xs)))
(prn "quantas vezes o 2 aparece: " (conta 2 xs))
(prn "quantas vezes o 7 aparece: " (conta 7 xs))

; Frequência de cada elemento, usando uma tabela com chave numérica.
(= freq (table))
(each x xs
  (= (freq x) (+ 1 (or (freq x) 0))))
(each x '(1 2 3 4)
  (prn "frequência de " x ": " (or (freq x) 0)))
