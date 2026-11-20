;;; exemplo_2.lsp -- Variaveis e tipos de dados
;;;
;;; AutoLISP e de tipagem dinamica. Os tipos do nucleo sao: INT (inteiro),
;;; REAL (real), STR (string), LIST (lista), SYM (simbolo), ENAME (nome de
;;; entidade), PICKSET (conjunto de selecao), SUBR (funcao interna).
;;; Nao ha declaracao de tipo: (setq) cria a variavel na hora.

(defun tipos-basicos (/ inteiro real texto lista tabela)
  (setq inteiro 42)
  (setq real 3.14159)
  (setq texto "Museu de Linguagens")
  (setq lista (list 1 2 3))
  (setq tabela
    (list
      (list "inteiro" inteiro (type inteiro))
      (list "real"    real    (type real))
      (list "texto"   texto   (type texto))
      (list "lista"   lista   (type lista))))
  tabela
)

;;; setq aceita varios pares variavel/valor de uma vez e devolve o ultimo
;;; valor atribuido.
(defun varios-setq (/ a b c)
  (setq a 1
        b 2
        c (+ a b))
  c
)

;;; Divisao em AutoLISP e sempre real: (/ 7 2) devolve 3.5, nunca 3.
;;; Para obter a parte inteira use fix; para arredondar, some 0.5 antes.
(defun divisao-real (/ a b)
  (setq a 7
        b 2)
  (list (/ a b) (fix (/ a b)))
)

;;; Variaveis locais (declaradas depois da barra) nascem com nil ao entrar
;;; na funcao e desaparecem ao sair. Variaveis nao declaradas sao globais
;;; e continuam existindo no desenho.
(defun contador-global ()
  (setq *contador* (if *contador* (1+ *contador*) 1))
  *contador*
)

;;; Verificacao de tipo antes de usar o valor, um idioma frequente porque
;;; a linguagem nao impede somar uma string a um numero (isso gera erro).
;;; A comparacao de simbolos usa eq, nao = (= e para numeros e strings).
(defun descreve (valor)
  (cond
    ((eq (type valor) 'INT)  "numero inteiro")
    ((eq (type valor) 'REAL) "numero real")
    ((eq (type valor) 'STR)  "string")
    ((eq (type valor) 'LIST) "lista")
    (T "outro tipo"))
)

(princ "\nexemplo_2.lsp carregado: teste (tipos-basicos), (divisao-real) e (descreve 1).")
(princ)
