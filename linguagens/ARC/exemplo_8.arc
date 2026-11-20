; exemplo_8.arc: Strings
;
; Em Arc a string é uma sequência de caracteres indexável; #\x é um
; caractere literal. string converte e concatena qualquer valor.

(= s "Museu de Linguagens")
(prn "texto: " s)
(prn "len: " (len s))
(prn "maiúsculas: " (upcase s))
(prn "minúsculas: " (downcase s))
(prn "primeiros 5 caracteres: " (cut s 0 5))
(prn "a partir do índice 11: " (cut s 11))
(prn "posição do L: " (pos (fn (c) (iso c #\L)) s))
(prn "caractere de índice 0: " (s 0))

; string monta uma string nova a partir de várias partes.
(prn "concatenação: " (string "Arc" " " 3 ".2"))
(= nome "Arc")
(= versao 3)
(prn "montagem: " (string nome " " versao))

; Conversões entre strings, símbolos e números.
(prn "símbolo para string: " (coerce 'arc 'string))
(prn "string para símbolo: " (coerce "arc" 'sym))
(prn "tipo do resultado: " (type (coerce "arc" 'sym)))

; split corta a string na posição indicada e devolve uma lista de partes.
(prn "split de arc3.2 na posição 3: " (split "arc3.2" 3))

; Igualdade: iso compara conteúdo; is compara identidade (bom para
; símbolos e números).
(prn "iso entre strings iguais: " (iso "abc" "abc"))
(prn "is entre símbolos iguais: " (is 'abc 'abc))

; Percorrendo caracteres e montando uma string nova.
(= invertida "")
(each c "Arc"
  (= invertida (string c invertida)))
(prn "invertida: " invertida)
