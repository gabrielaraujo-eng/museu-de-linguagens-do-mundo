;;; exercicio_2.lsp -- Conversao de Celsius para Fahrenheit
;;;
;;; Enunciado: ler uma temperatura em graus Celsius e mostrar o valor em
;;; graus Fahrenheit, com duas casas decimais.
;;; Conceitos: getreal, aritmetica real, rtos, defun com argumento.

;;; F = C * 9/5 + 32. A divisao em AutoLISP ja e real, mas 9.0/5.0 deixa
;;; a intencao explicita e evita duvidas de leitura.
(defun celsius-para-fahrenheit (c)
  (+ (* c (/ 9.0 5.0)) 32.0)
)

;;; Conversao inversa, para conferir o resultado.
(defun fahrenheit-para-celsius (f)
  (* (- f 32.0) (/ 5.0 9.0))
)

;;; getreal aceita "21", "21.5" e "-3.5"; devolve nil se o usuario cancela.
(defun c:celsius (/ c f)
  (setq c (getreal "\nTemperatura em Celsius: "))
  (if (null c)
    (princ "\nNenhum valor informado.")
    (progn
      (setq f (celsius-para-fahrenheit c))
      (princ (strcat "\n" (rtos c 2 2) " C = " (rtos f 2 2) " F"))))
  (princ)
)

(princ "\nexercicio_2.lsp carregado: digite CELSIUS ou teste (celsius-para-fahrenheit 100).")
(princ)
