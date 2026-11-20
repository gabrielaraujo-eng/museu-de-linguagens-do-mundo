;;; exemplo_4.lsp -- Repeticoes: repeat, while e foreach
;;;
;;; AutoLISP nao tem for. Os tres lacos disponiveis sao:
;;;   repeat  -- numero fixo de repeticoes, conhecido antes do laco;
;;;   while   -- repete enquanto o teste for verdadeiro (nao nil);
;;;   foreach -- percorre os elementos de uma lista.
;;; Todos devolvem nil; o resultado util fica em variaveis acumuladoras.

;;; repeat exige um inteiro >= 0. (repeat 0 ...) nao executa o corpo.
(defun tabuada (n / i res)
  (setq i 1
        res nil)
  (repeat 10
    (setq res (append res (list (* n i))))
    (setq i (1+ i)))
  res
)

;;; while: o teste e reavaliado a cada volta, entao a variavel de controle
;;; precisa ser atualizada dentro do corpo, senao o laco nunca termina.
(defun soma-ate (n / i soma)
  (setq i 1
        soma 0)
  (while (<= i n)
    (setq soma (+ soma i))
    (setq i (1+ i)))
  soma
)

;;; O mesmo resultado com repeat: como o numero de voltas e conhecido
;;; (n), o contador precisa ser mantido a mao dentro do corpo.
(defun soma-ate-repeat (n / soma i)
  (setq soma 0
        i 1)
  (repeat n
    (setq soma (+ soma i))
    (setq i (1+ i)))
  soma
)

;;; foreach: (foreach variavel lista corpo). A variavel recebe cada
;;; elemento em sequencia e nao e local por si so.
(defun soma-lista (lst / soma)
  (setq soma 0)
  (foreach x lst
    (setq soma (+ soma x)))
  soma
)

;;; while com condicao de parada composta: percorre uma lista consumindo-a
;;; com cdr, ate ficar vazia (nil).
(defun maior-da-lista (lst / maior resto)
  (setq maior (car lst)
        resto (cdr lst))
  (while resto
    (if (> (car resto) maior)
      (setq maior (car resto)))
    (setq resto (cdr resto)))
  maior
)

;;; Monta uma string por repeticao -- util para separadores e barras.
(defun pontos-suspensao (n / res)
  (setq res "")
  (repeat n
    (setq res (strcat res ".")))
  res
)

(princ "\nexemplo_4.lsp carregado: teste (tabuada 3), (soma-ate 10) e (maior-da-lista '(4 9 2)).")
(princ)
