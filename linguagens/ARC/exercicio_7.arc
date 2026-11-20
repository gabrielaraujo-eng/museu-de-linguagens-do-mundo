; exercicio_7.arc: Divisão segura (tema: tratamento de erros)
;
; Objetivo: dividir vários pares de números, sinalizando com err quando
; o divisor é zero e capturando a falha com on-err, sem interromper o
; restante do programa.

(def divide-seguro (a b)
  (if (is b 0)
      (err (string "não é possível dividir " a " por zero"))
      (/ a b)))

; Cada par é processado dentro de seu próprio on-err: um erro em um par
; não impede o processamento dos seguintes. O tratador recebe o objeto
; de condição, cuja forma textual varia entre implementações, por isso
; imprimimos o contexto do par em vez do objeto.
(each par '((10 2) (7 0) (9 3) (5 0))
  (on-err (fn (c) (prn "falha em " (car par) "/" (cadr par) ": divisor zero"))
          (fn () (prn (car par) " / " (cadr par) " = "
                      (divide-seguro (car par) (cadr par))))))

; errsafe resume o mesmo tratamento quando só interessa o valor.
(= resultados (map (fn (par) (errsafe (divide-seguro (car par) (cadr par))))
                   '((8 2) (1 0) (15 3))))
(prn "resultados com errsafe (nil onde houve erro): " resultados)

; Somando apenas os resultados válidos.
(= soma 0)
(each r resultados
  (when r (= soma (+ soma r))))
(prn "soma dos válidos: " soma)
