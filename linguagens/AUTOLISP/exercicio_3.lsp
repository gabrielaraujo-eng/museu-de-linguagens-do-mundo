;;; exercicio_3.lsp -- Classificacao de um numero
;;;
;;; Enunciado: ler um numero real e dizer se ele e positivo, negativo ou
;;; zero, informando tambem se e inteiro ou tem parte fracionaria.
;;; Conceitos: cond, if, equal com margem de tolerancia, fix.

;;; Comparar reais com = e arriscado; para "e inteiro?" comparamos o valor
;;; com a sua parte inteira usando equal e uma tolerancia pequena.
(defun inteiro-p (x)
  (equal x (float (fix x)) 0.000001)
)

;;; Classificacao com cond: a primeira clausula verdadeira decide.
(defun classifica (n)
  (cond
    ((> n 0) "positivo")
    ((< n 0) "negativo")
    (T       "zero"))
)

;;; Texto completo, juntando as duas informacoes.
(defun descreve-numero (n)
  (strcat (classifica n)
          (if (inteiro-p n) ", inteiro" ", com parte fracionaria"))
)

(defun c:classificar (/ n)
  (setq n (getreal "\nNumero real: "))
  (if (null n)
    (princ "\nNenhum valor informado.")
    (princ (strcat "\n" (rtos n 2 3) " e " (descreve-numero n) ".")))
  (princ)
)

(princ "\nexercicio_3.lsp carregado: digite CLASSIFICAR ou teste (classifica -2.5).")
(princ)
