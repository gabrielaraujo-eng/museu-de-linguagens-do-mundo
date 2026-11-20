; exercicio_8.arc: Contagem de vogais (tema: strings)
;
; Objetivo: percorrer uma string caractere por caractere, contar as
; vogais (maiúsculas e minúsculas) e montar a string só com as consoantes.

(def vogal? (c)
  (or (iso c #\a) (iso c #\e) (iso c #\i) (iso c #\o) (iso c #\u)
      (iso c #\A) (iso c #\E) (iso c #\I) (iso c #\O) (iso c #\U)))

(def conta-vogais (s)
  (let n 0
    (each c s
      (when (vogal? c)
        (= n (+ n 1))))
    n))

(def so-consoantes (s)
  (let r ""
    (each c s
      (unless (vogal? c)
        (= r (string r c))))
    r))

(= frase "Museu de Linguagens do Mundo")
(prn "frase: " frase)
(prn "comprimento: " (len frase))
(prn "vogais: " (conta-vogais frase))
(prn "consoantes e espaços: " (len (so-consoantes frase)))
(prn "sem vogais: " (so-consoantes frase))
(prn "em maiúsculas: " (upcase frase))
