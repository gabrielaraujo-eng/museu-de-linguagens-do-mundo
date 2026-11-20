;;; exercicio_8.lsp -- Contagem de vogais em um texto
;;;
;;; Enunciado: ler um texto digitado pelo usuario e contar quantas vogais
;;; ele contem, ignorando a diferenca entre maiusculas e minusculas.
;;; Conceitos: strlen, substr, strcase, member, while.

;;; Lista de vogais como constante reutilizavel.
(defun vogais ()
  (list "a" "e" "i" "o" "u")
)

;;; Percorre a string posicao por posicao. substr com comprimento 1 isola
;;; um caractere; strcase com o argumento T converte para minuscula, o que
;;; permite comparar com a lista de vogais sem diferenciar caixa.
(defun conta-vogais (texto / i n total c)
  (setq i 1
        n (strlen texto)
        total 0)
  (while (<= i n)
    (setq c (strcase (substr texto i 1) T))
    (if (member c (vogais))
      (setq total (1+ total)))
    (setq i (1+ i)))
  total
)

;;; Versao com foreach sobre a lista de vogais: para cada vogal, conta
;;; quantas vezes ela aparece e soma. Serve para comparar as duas
;;; abordagens (a primeira percorre o texto, esta percorre o alfabeto).
(defun conta-vogais-por-vogal (texto / total c i n)
  (setq total 0)
  (foreach v (vogais)
    (setq i 1
          n (strlen texto))
    (while (<= i n)
      (if (= (strcase (substr texto i 1) T) v)
        (setq total (1+ total)))
      (setq i (1+ i))))
  total
)

(defun c:vogais (/ texto)
  (setq texto (getstring T "\nTexto: "))
  (if (or (null texto) (= texto ""))
    (princ "\nNenhum texto informado.")
    (princ (strcat "\n\"" texto "\" tem "
                   (itoa (conta-vogais texto)) " vogais.")))
  (princ)
)

(princ "\nexercicio_8.lsp carregado: digite VOGAIS ou teste (conta-vogais \"AutoLISP\").")
(princ)
