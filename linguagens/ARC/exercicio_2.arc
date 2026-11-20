; exercicio_2.arc: Conversão de temperatura (tema: variáveis e tipos)
;
; Objetivo: converter graus Celsius em Fahrenheit com a fórmula
; F = C * 9 / 5 + 32, usando uma função e uma lista de temperaturas.
; Como a divisão de inteiros em Arc é exata, a multiplicação vem antes.

(def celsius->fahrenheit (c)
  (+ (/ (* c 9) 5) 32))

(each c '(-10 0 25 100)
  (prn c " C = " (celsius->fahrenheit c) " F"))

; Verificação de tipos antes de converter, com a função number.
(def converte-seguro (c)
  (if (number c)
      (celsius->fahrenheit c)
      (err "temperatura não numérica: " c)))

; A divisão de inteiros em Arc é exata: 493/5 é o valor exato de 98,6.
(prn "conversão de 37: " (converte-seguro 37))
(prn "conversão inválida protegida: " (errsafe (converte-seguro "quente")))

; Uma temperatura em ponto flutuante também é aceita (tipo num).
(prn "36.5 C = " (converte-seguro 36.5) " F")
