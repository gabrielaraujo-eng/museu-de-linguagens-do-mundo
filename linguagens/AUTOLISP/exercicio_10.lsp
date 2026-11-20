;;; exercicio_10.lsp -- Estatisticas de uma lista de notas
;;;
;;; Enunciado: a partir de uma lista de seis notas, mostrar a maior, a
;;; menor, a media e quantas notas ficaram abaixo da media.
;;; Conceitos: apply com max e min, mapcar, length, filtragem com foreach,
;;; arredondamento com rtos.

;;; apply aplica uma funcao a uma lista de argumentos: (apply 'max lst)
;;; equivale a (max 1 2 3) para uma lista de tres elementos.
(defun maior-nota (lst)
  (apply 'max lst)
)

(defun menor-nota (lst)
  (apply 'min lst)
)

(defun media-notas (lst)
  (/ (apply '+ lst) (float (length lst)))
)

;;; Conta quantos elementos satisfazem "ser menor que a referencia".
;;; O teste fica dentro do laco porque AutoLISP nao aceita funcao
;;; anonima como variavel (o primeiro elemento da forma precisa ser o
;;; simbolo da funcao ou uma lista lambda literal).
(defun abaixo-de (referencia lst / total)
  (setq total 0)
  (foreach x lst
    (if (< x referencia)
      (setq total (1+ total))))
  total
)

;;; Relatorio completo em uma lista: (maior menor media abaixo).
(defun estatisticas (lst / media)
  (setq media (media-notas lst))
  (list (maior-nota lst)
        (menor-nota lst)
        media
        (abaixo-de media lst))
)

;;; Arredonda para uma casa decimal apenas na apresentacao.
(defun c:notas (/ notas r media)
  (setq notas (list 7.5 4.0 9.5 6.0 8.0 5.5))
  (setq r (estatisticas notas))
  (setq media (caddr r))
  (princ (strcat "\nNotas: " (itoa (length notas)) " lancamentos."))
  (princ (strcat "\nMaior: " (rtos (car r) 2 1)))
  (princ (strcat "\nMenor: " (rtos (cadr r) 2 1)))
  (princ (strcat "\nMedia: " (rtos media 2 2)))
  (princ (strcat "\nAbaixo da media: " (itoa (cadddr r)) " nota(s)."))
  (princ)
)

(princ "\nexercicio_10.lsp carregado: digite NOTAS ou teste (estatisticas '(7 8 9)).")
(princ)
