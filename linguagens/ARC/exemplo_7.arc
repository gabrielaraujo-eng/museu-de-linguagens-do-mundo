; exemplo_7.arc: Tratamento de erros
;
; Arc não tem try/catch. Erros são sinalizados com (err ...) e capturados
; com on-err, que recebe duas funções:
;   (on-err tratador corpo)
; O tratador recebe o objeto de condição do erro e o corpo é uma função
; sem argumentos. Como a representação textual desse objeto varia entre
; implementações (Arc 3.2 e o fork Anarki diferem), os tratadores abaixo
; imprimem uma descrição fixa em vez do objeto bruto.
; errsafe é o atalho que devolve nil quando o corpo falha.

(def divide (a b)
  (if (is b 0)
      (err (string "divisão por zero: " a "/" b))
      (/ a b)))

(prn "divisão válida: " (divide 10 2))

; Capturando o erro sinalizado explicitamente: o cálculo seguinte não
; interrompe o programa.
(on-err (fn (c) (prn "erro capturado: não foi possível dividir 1 por 0"))
        (fn () (prn "resultado: " (divide 1 0))))

; errsafe devolve nil em vez de propagar a falha.
(prn "errsafe com erro: " (errsafe (divide 1 0)))
(prn "errsafe com sucesso: " (errsafe (divide 9 3)))

; Validação defensiva: checar as pré-condições antes de calcular.
(def raiz-quadrada (x)
  (if (no (number x))
      (err (string "argumento não numérico: " x))
      (< x 0)
      (err (string "não existe raiz real de número negativo: " x))
      (sqrt x)))

(prn "raiz de 81: " (raiz-quadrada 81))
(on-err (fn (c) (prn "segundo erro: argumento negativo rejeitado"))
        (fn () (raiz-quadrada -4)))

; Erros do próprio interpretador também são capturáveis.
(prn "car de um número, protegido: " (errsafe (car 42)))
