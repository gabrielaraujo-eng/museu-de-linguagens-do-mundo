;;; exemplo_8.lsp -- Manipulacao de strings
;;;
;;; Strings em AutoLISP sao sequencias de caracteres entre aspas duplas,
;;; com escapes \n (nova linha), \t (tab), \\ (barra invertida) e \"
;;; (aspas). Nao ha interpolacao: a montagem e feita com strcat.

;;; strcat concatena qualquer numero de strings.
(defun rotulo (nome valor)
  (strcat nome ": " valor)
)

;;; strlen conta caracteres; substr usa indice inicial 1 (nao 0).
;;; (substr s inicio comprimento) -- se o comprimento passar do fim,
;;; devolve o que existir, sem erro.
(defun analisa-texto (s / n)
  (setq n (strlen s))
  (list n
        (substr s 1 1)      ; primeiro caractere
        (substr s n 1)      ; ultimo caractere
        (substr s 2 (1- n))); sem o primeiro
)

;;; strcase converte para maiusculas por padrao; com T, para minusculas.
(defun normaliza (s)
  (list (strcase s) (strcase s T))
)

;;; Conversoes entre texto e numero. atoi/atof param no primeiro caractere
;;; que nao faz parte do numero e devolvem 0 quando nao ha numero nenhum.
(defun conversoes ()
  (list
    (atoi "42")            ; 42
    (atoi "-7 graus")      ; -7
    (atoi "abc")           ; 0
    (atof "3.75")          ; 3.75
    (itoa 42)              ; "42"
    (rtos 3.14159 2 3)     ; "3.142" -- modo 2 = decimal, 3 casas
    (rtos 1234.6 2 0))     ; "1235"
)

;;; ascii e chr transitam entre caractere e codigo.
(defun codigos (/ letra)
  (setq letra "A")
  (list (ascii letra) (chr 66))
)

;;; Percorrer uma string caractere por caractere: substr com comprimento 1
;;; dentro de um while controlado por strlen.
(defun inverte-texto (s / n i res)
  (setq n (strlen s)
        i n
        res "")
  (while (> i 0)
    (setq res (strcat res (substr s i 1)))
    (setq i (1- i)))
  res
)

;;; Contagem com strcase para ignorar a caixa das letras.
(defun conta-letra (s letra / alvo i n total)
  (setq alvo (strcase letra)
        i 1
        n (strlen s)
        total 0)
  (while (<= i n)
    (if (= (strcase (substr s i 1)) alvo)
      (setq total (1+ total)))
    (setq i (1+ i)))
  total
)

(princ "\nexemplo_8.lsp carregado: teste (analisa-texto \"AutoLISP\") e (inverte-texto \"abc\").")
(princ)
