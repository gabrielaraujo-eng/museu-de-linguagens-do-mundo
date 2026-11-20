;;; exemplo_10.lsp -- Algoritmos: ordenacao recursiva e desenho derivado
;;;
;;; Exemplo de fecho da sequencia: um algoritmo classico escrito apenas
;;; com recursao e listas, e o resultado do algoritmo transformado em
;;; geometria por meio de command.

;;; Filtros com acumulador: percorrem a lista e guardam, em ordem, os
;;; elementos que satisfazem o teste. O reverse no fim desfaz a inversao
;;; causada por cons.
(defun menores-que (pivo lst / res)
  (setq res nil)
  (foreach x lst
    (if (< x pivo)
      (setq res (cons x res))))
  (reverse res)
)

(defun maiores-ou-iguais (pivo lst / res)
  (setq res nil)
  (foreach x lst
    (if (>= x pivo)
      (setq res (cons x res))))
  (reverse res)
)

;;; Quicksort em AutoLISP: escolhe o primeiro elemento como pivo, ordena
;;; as duas particoes por recursao e junta com append. A lista vazia
;;; (nil) e o caso base.
(defun quicksort (lst)
  (if (null lst)
    nil
    (append
      (quicksort (menores-que (car lst) (cdr lst)))
      (list (car lst))
      (quicksort (maiores-ou-iguais (car lst) (cdr lst)))))
)

;;; Verificacao de ordenacao, util como teste automatico do algoritmo.
(defun ordenada-p (lst / resto ok)
  (setq ok T
        resto lst)
  (while (and ok (cdr resto))
    (if (> (car resto) (cadr resto))
      (setq ok nil))
    (setq resto (cdr resto)))
  ok
)

;;; Transforma a lista ordenada em vertices: x cresce de 20 em 20 e y
;;; recebe o valor ordenado.
(defun vertices-de-escada (valores / i pts)
  (setq i 0
        pts nil)
  (foreach v valores
    (setq pts (append pts (list (list (* i 20.0) (float v) 0.0))))
    (setq i (1+ i)))
  pts
)

;;; Desenha a polilinha. apply entrega a lista inteira de argumentos a
;;; command numa unica chamada, o que evita deixar o comando PLINE ativo
;;; esperando o proximo ponto.
(defun desenha-escada (pts / args)
  (setq args (append (list "_.PLINE") pts (list "")))
  (setvar "CMDECHO" 0)
  (apply 'command args)
  (setvar "CMDECHO" 1)
  (length pts)
)

;;; Converte uma lista de numeros em texto, para exibir no relatorio.
(defun a-texto (lst / res)
  (setq res "")
  (foreach x lst
    (setq res (strcat res (itoa x) " ")))
  res
)

;;; Comando completo: ordena, confere e desenha.
(defun c:escada (/ valores ordenados pts n)
  (setq valores '(30 10 40 20 50))
  (setq ordenados (quicksort valores))
  (if (ordenada-p ordenados)
    (progn
      (setq pts (vertices-de-escada ordenados))
      (setq n (desenha-escada pts))
      (princ (strcat "\n" (itoa n) " vertices desenhados."))
      (princ (strcat "\nOrdem: " (a-texto ordenados))))
    (princ "\nFalha na ordenacao."))
  (princ)
)

(princ "\nexemplo_10.lsp carregado: teste (quicksort '(3 1 2)) e o comando ESCADA.")
(princ)
