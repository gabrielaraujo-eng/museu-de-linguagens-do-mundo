;;; exercicio_6.lsp -- Inversao de uma lista e teste de palindromo
;;;
;;; Enunciado: inverter uma lista de coordenadas X e verificar se a
;;; sequencia original e um palindromo (leitura igual nos dois sentidos).
;;; Conceitos: foreach, cons como acumulador, equal para comparar listas.

;;; Inversao com acumulador: cons coloca cada elemento na frente, o que
;;; inverte a ordem naturalmente. Nao usamos a funcao reverse aqui para
;;; mostrar o mecanismo; (reverse lst) faria o mesmo em uma chamada.
(defun inverter (lst / res)
  (setq res nil)
  (foreach x lst
    (setq res (cons x res)))
  res
)

;;; equal compara listas elemento por elemento; = nao serve para listas.
(defun palindromo-p (lst)
  (equal lst (inverter lst))
)

;;; Lista de exemplo: coordenadas X de uma polilinha.
(defun xs-de-exemplo ()
  (list 0.0 10.0 20.0 30.0 40.0)
)

(defun c:inverter_lista (/ xs inv)
  (setq xs (xs-de-exemplo))
  (setq inv (inverter xs))
  (princ "\nOriginal: ")
  (foreach x xs (princ (strcat (rtos x 2 1) " ")))
  (princ "\nInvertida: ")
  (foreach x inv (princ (strcat (rtos x 2 1) " ")))
  (princ (strcat "\nPalindromo? "
                 (if (palindromo-p xs) "sim" "nao")))
  (princ)
)

(princ "\nexercicio_6.lsp carregado: digite INVERTER_LISTA ou teste (inverter '(1 2 3)).")
(princ)
