;;; exemplo_6.lsp -- Estruturas de dados: listas e pares pontilhados
;;;
;;; A unica estrutura composta do AutoLISP e a lista. Pontos tambem sao
;;; listas de tres reais, como (10.0 20.0 0.0), e as listas de associacao
;;; (pares pontilhados) fazem o papel de registros e dicionarios.

;;; Anatomia: car devolve o primeiro elemento, cdr devolve o resto.
;;; cadr, caddr e cddr sao abreviacoes de composicoes de car e cdr.
(defun anatomia (/ lst)
  (setq lst (list 10 20 30 40))
  (list
    (car lst)        ; 10
    (cadr lst)       ; 20
    (caddr lst)      ; 30
    (cdr lst)        ; (20 30 40)
    (nth 3 lst)      ; 40  (indice comeca em 0)
    (length lst)     ; 4
    (last lst))      ; (40) -- last devolve lista, nao elemento
)

;;; Construcao: cons acrescenta na frente; append junta listas.
(defun constroi (/ lst)
  (setq lst nil)
  (setq lst (cons 1 lst))          ; (1)
  (setq lst (cons 0 lst))          ; (0 1)
  (reverse (append lst '(2 3)))    ; (3 2 0 1)
)

;;; Pares pontilhados: (cons chave valor) produz ("largura" . 80.0) e
;;; assoc consulta a lista por chave, devolvendo o par inteiro.
(defun ficha-tecnica (/ ficha)
  (setq ficha
    (list
      (cons "largura" 80.0)
      (cons "altura" 50.0)
      (cons "camada" "PAREDES")))
  (list
    (cdr (assoc "largura" ficha))        ; 80.0
    (cdr (assoc "camada" ficha))         ; "PAREDES"
    (cdr (assoc "profundidade" ficha)))  ; nil -- chave ausente
)

;;; member procura um elemento e devolve a cauda da lista a partir dele;
;;; e nil quando nao encontra. Serve como teste de pertinencia.
(defun contem-p (x lst)
  (if (member x lst) T nil)
)

;;; mapcar aplica uma funcao a cada elemento; com duas listas, percorre
;;; as duas em paralelo e para na menor.
(defun soma-vetores (a b)
  (mapcar '+ a b)
)

;;; Uma lista de pontos, o formato usado por command para desenhar.
(defun triangulo-pontos ()
  (list (list 0.0 0.0 0.0)
        (list 100.0 0.0 0.0)
        (list 50.0 80.0 0.0))
)

(princ "\nexemplo_6.lsp carregado: teste (anatomia), (ficha-tecnica) e (soma-vetores '(1 2) '(10 20)).")
(princ)
