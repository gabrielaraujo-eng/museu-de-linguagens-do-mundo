;;; exercicio_4.lsp -- Soma dos numeros pares de 1 a 20
;;;
;;; Enunciado: somar os numeros pares de 1 a 20 e mostrar a soma e a
;;; quantidade de parcelas.
;;; Conceitos: while, rem, acumuladores, if sem "senao".

;;; rem devolve o resto da divisao; resto zero indica numero par.
(defun soma-pares-ate (limite / i soma parcelas)
  (setq i 1
        soma 0
        parcelas 0)
  (while (<= i limite)
    (if (equal (rem i 2) 0)
      (progn
        (setq soma (+ soma i))
        (setq parcelas (1+ parcelas))))
    (setq i (1+ i)))
  (list soma parcelas)
)

;;; Versao com repeat: percorre exatamente "limite" valores, com o mesmo
;;; teste de paridade dentro do corpo.
(defun soma-pares-repeat (limite / i soma)
  (setq i 1
        soma 0)
  (repeat limite
    (if (equal (rem i 2) 0)
      (setq soma (+ soma i)))
    (setq i (1+ i)))
  soma
)

(defun c:soma_pares (/ r)
  (setq r (soma-pares-ate 20))
  (princ (strcat "\nSoma dos pares de 1 a 20: " (itoa (car r))))
  (princ (strcat "\nQuantidade de parcelas: " (itoa (cadr r))))
  (princ (strcat "\nConferencia com repeat: " (itoa (soma-pares-repeat 20))))
  (princ)
)

(princ "\nexercicio_4.lsp carregado: digite SOMA_PARES ou teste (soma-pares-ate 20).")
(princ)
