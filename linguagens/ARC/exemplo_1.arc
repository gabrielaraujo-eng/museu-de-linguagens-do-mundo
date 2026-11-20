; exemplo_1.arc: Olá, Mundo em Arc
;
; Arc é um dialeto de Lisp criado por Paul Graham e Robert Morris,
; usado desde 2001 e publicado como Arc 3.2 em 2008.
; Um programa Arc é uma sequência de expressões; cada expressão é uma
; lista entre parênteses cujo primeiro elemento é a função e os demais
; são os argumentos. Comentários vão de ";" até o fim da linha.
;
; Para executar: iniciar o interpretador com "racket -f as.scm"
; e depois avaliar (load "exemplo_1.arc").

; prn imprime todos os argumentos e termina com uma quebra de linha.
(prn "Olá, Mundo!")

; pr imprime sem quebra de linha; os argumentos saem concatenados.
(pr "Olá, ")
(pr "Mundo")
(prn)

; prn aceita qualquer quantidade de argumentos, de tipos diferentes.
(prn "Arc nasceu em " 2001 " e tem " 3 " letras.")

; Toda expressão devolve um valor; prn devolve o último valor que imprimiu.
(prn "valor de retorno de prn: " (prn "texto intermediário"))
