;;; exemplo_1.lsp -- "Ola, Mundo" em AutoLISP
;;; Museu de Linguagens do Mundo -- pasta AUTOLISP
;;;
;;; AutoLISP e o dialeto de Lisp embutido no AutoCAD desde 1986. Todo o
;;; codigo vive dentro de uma unica forma: a chamada de funcao entre
;;; parenteses. O comentario comeca com um ponto e virgula e vai ate o
;;; fim da linha.
;;;
;;; Como carregar no AutoCAD:
;;;   1. digite APPLOAD e escolha este arquivo, ou
;;;   2. na linha de comando, digite: (load "exemplo_1.lsp")
;;;   3. depois digite OLA (o prefixo c: cria um comando de AutoCAD).
;;;
;;; O (princ) final nao imprime nada e evita que o valor devolvido pela
;;; funcao seja mostrado na linha de comando. E um idioma da linguagem.

(defun c:ola ()
  (princ "\nOla, Mundo!")
  (princ)
)

;;; Uma segunda versao, sem efeito colateral: devolve a mensagem como
;;; string em vez de imprimir. AutoLISP nao tem "return": o valor da
;;; funcao e o valor da ultima expressao avaliada.
(defun mensagem-ola (/ saudacao alvo)
  (setq saudacao "Ola")
  (setq alvo "Mundo")
  (strcat saudacao ", " alvo "!")
)

;;; \n dentro da string e o caractere de nova linha; \" seria uma aspa.
;;; Acentos: dependem da codificacao do arquivo .lsp (ver README).
(princ "\nexemplo_1.lsp carregado: digite OLA para executar.")
(princ)
