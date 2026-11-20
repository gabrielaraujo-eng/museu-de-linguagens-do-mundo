; exercicio_5.arc: Funções com parâmetros opcionais e variádicos
;
; Objetivo: escrever três funções que exercitam as formas de parâmetro
; de def: parâmetros obrigatórios, opcionais com (o nome padrão) e um
; parâmetro solto que recolhe todos os argumentos restantes.

(def maior-de-tres (a b c)
  (max a b c))

; Média de qualquer quantidade de argumentos: "args" recebe a lista toda.
(def media args
  (/ (apply + args) (len args)))

; Desconto com percentual padrão de 10 por cento.
(def com-desconto (preco (o percentual 10))
  (- preco (/ (* preco percentual) 100)))

(prn "maior de 4, 9, 2: " (maior-de-tres 4 9 2))
(prn "média de 4 argumentos: " (media 4 6 8 10))
(prn "média de 2 argumentos: " (media 5 15))
(prn "desconto padrão sobre 200: " (com-desconto 200))
(prn "desconto de 25 por cento sobre 200: " (com-desconto 200 25))

; Composição: função que recebe outra função como argumento.
(def aplica-duas-vezes (f x)
  (f (f x)))
(prn "aplica-duas-vezes de dobro em 5: " (aplica-duas-vezes (fn (n) (* 2 n)) 5))

; Recursão com dois casos-base.
(def soma-digitos (n)
  (if (< n 10)
      n
      (+ (mod n 10) (soma-digitos (trunc (/ n 10))))))
(prn "soma dos dígitos de 9875: " (soma-digitos 9875))
