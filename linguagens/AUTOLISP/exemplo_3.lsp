;;; exemplo_3.lsp -- Controle de fluxo: if, cond, progn, and, or, not
;;;
;;; Em AutoLISP, o unico valor falso e nil. Tudo o mais -- inclusive 0,
;;; "" e a lista vazia -- e verdadeiro. Isso difere de C e de outras
;;; linguagens e e a origem de muitos erros de iniciante.

;;; (if teste entao senao): a parte "senao" e opcional e, sem ela, o
;;; resultado e nil quando o teste falha.
(defun classifica-numero (n)
  (if (> n 0)
    "positivo"
    (if (< n 0) "negativo" "zero"))
)

;;; cond: lista de clausulas testadas em ordem. A clausula T funciona
;;; como "senao" e deve ficar por ultimo.
(defun faixa (n)
  (cond
    ((< n 0)   "negativo")
    ((< n 10)  "unidade")
    ((< n 100) "dezena")
    (T         "centena ou mais"))
)

;;; progn agrupa varias expressoes onde a sintaxe aceita apenas uma.
;;; Sem progn, o if executaria somente a primeira expressao.
(defun avisa-se-negativo (n)
  (if (< n 0)
    (progn
      (princ "\nAtencao: valor negativo.")
      (princ "\nConsidere usar o valor absoluto.")
      T)
    nil)
)

;;; and e or avaliam da esquerda para a direita e param no primeiro
;;; resultado decisivo (curto-circuito), como em outras linguagens.
;;; not devolve T apenas para nil.
(defun primeiro-quadrante-p (x y)
  (and (> x 0) (> y 0))
)

(defun fora-dos-eixos-p (x y)
  (or (/= x 0) (/= y 0))
)

;;; Combinacao: quadrante de um ponto, usando cond e and.
(defun quadrante (x y)
  (cond
    ((and (> x 0) (> y 0)) 1)
    ((and (< x 0) (> y 0)) 2)
    ((and (< x 0) (< y 0)) 3)
    ((and (> x 0) (< y 0)) 4)
    (T 0))
)

(princ "\nexemplo_3.lsp carregado: teste (faixa 42), (quadrante -3 5) e (avisa-se-negativo -1).")
(princ)
