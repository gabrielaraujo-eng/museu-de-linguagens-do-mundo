;;; exemplo_5.lsp -- Funcoes: defun, argumentos, variaveis locais e recursao
;;;
;;; Forma geral:
;;;   (defun nome (arg1 arg2 / local1 local2) expressao ...)
;;; A barra separa argumentos de variaveis locais e precisa de espaco dos
;;; dois lados. Sem barra, nao ha variaveis locais. Sem nada depois do
;;; nome, a funcao nao recebe argumentos: (defun nome () ...).
;;; Se o nome comecar com c:, o AutoCAD cria um comando com esse nome.

;;; Funcao de um argumento: devolve o valor da ultima expressao.
(defun quadrado (n)
  (* n n)
)

;;; Varias expressoes no corpo: todas sao avaliadas, a ultima devolve.
(defun media3 (a b c / soma)
  (setq soma (+ a b c))
  (/ soma 3.0)
)

;;; Recursao: AutoLISP permite que a funcao chame a si mesma. Nao ha
;;; otimizacao de chamada em cauda, portanto casos grandes estouram a
;;; pilha; use recursao para casos pequenos e lacos para volumes grandes.
(defun fatorial (n)
  (if (<= n 1)
    1
    (* n (fatorial (1- n))))
)

;;; Potencia inteira sem usar expt, para mostrar o padrao recursivo.
(defun potencia (base expoente)
  (cond
    ((= expoente 0) 1)
    ((< expoente 0) (/ 1.0 (potencia base (- expoente))))
    (T (* base (potencia base (1- expoente)))))
)

;;; Funcao usada como dado: mapcar recebe o simbolo da funcao e aplica a
;;; cada elemento da lista.
(defun soma-dos-quadrados (lst)
  (apply '+ (mapcar 'quadrado lst))
)

;;; Comando de AutoCAD: o prefixo c: registra o nome na linha de comando.
;;; getint devolve nil se o usuario cancelar, por isso o teste (and n ...).
;;; Inteiros de AutoLISP sao de 32 bits: 12! ainda cabe, 13! nao.
(defun c:fat (/ n)
  (setq n (getint "\nInteiro de 0 a 12: "))
  (if (and n (<= 0 n 12))
    (princ (strcat "\n" (itoa n) "! = " (itoa (fatorial n))))
    (princ "\nValor invalido."))
  (princ)
)

(princ "\nexemplo_5.lsp carregado: teste (fatorial 5), (potencia 2 10) e o comando FAT.")
(princ)
