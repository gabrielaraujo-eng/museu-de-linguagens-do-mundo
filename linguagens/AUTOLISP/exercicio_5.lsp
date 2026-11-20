;;; exercicio_5.lsp -- Potencia inteira calculada por laco
;;;
;;; Enunciado: calcular base elevada a um expoente inteiro nao negativo
;;; sem usar expt, mostrando tambem a tabela de potencias de 2.
;;; Conceitos: while, repeat, acumulador multiplicativo, validacao de
;;; entrada com getint e initget.

;;; Laco multiplicativo: comeca em 1 e multiplica a base "expoente" vezes.
;;; Expoente zero devolve 1, inclusive para base zero (convencao adotada).
(defun potencia-por-laco (base expoente / i res)
  (setq i 0
        res 1)
  (while (< i expoente)
    (setq res (* res base))
    (setq i (1+ i)))
  res
)

;;; Tabela de potencias: lista de (expoente resultado) para 0..n.
(defun tabela-potencias (base n / i res)
  (setq i 0
        res nil)
  (repeat (1+ n)
    (setq res (append res (list (list i (potencia-por-laco base i)))))
    (setq i (1+ i)))
  res
)

;;; initget 1 torna o valor obrigatorio: o AutoCAD repete a pergunta em
;;; vez de aceitar Enter vazio. getint aceita apenas inteiros.
(defun c:potencia (/ base expoente)
  (initget 1)
  (setq base (getint "\nBase inteira: "))
  (initget 1)
  (setq expoente (getint "\nExpoente inteiro nao negativo: "))
  (cond
    ((null base) nil)
    ((< expoente 0) (princ "\nO expoente deve ser nao negativo."))
    (T (princ (strcat "\n" (itoa base) "^" (itoa expoente) " = "
                      (itoa (potencia-por-laco base expoente))))))
  (princ)
)

(princ "\nexercicio_5.lsp carregado: digite POTENCIA ou teste (potencia-por-laco 3 4).")
(princ)
