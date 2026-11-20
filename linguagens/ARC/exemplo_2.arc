; exemplo_2.arc: Variáveis e tipos
;
; Arc não tem declaração de tipos nem palavras-chave de definição de
; variável: um nome é apenas ligado a um valor. (= nome valor) atribui
; no escopo atual; no nível superior isso cria uma variável global.

(= linguagem "Arc")
(= ano 2001)
(= criador 'paul-graham)   ; símbolo: um nome que se avalia a si mesmo
(= versao 3.2)

(prn "linguagem: " linguagem)
(prn "ano: " ano)
(prn "criador: " criador)
(prn "versao: " versao)

; let cria uma ligação local, visível apenas dentro do corpo.
(let local 10
  (prn "let: " (* local 2)))

; withs liga várias variáveis em sequência: as seguintes enxergam as anteriores.
(withs (a 2 b 3 c (+ a b))
  (prn "withs: a=" a " b=" b " c=" c))

; type devolve o tipo do valor; isa compara esse tipo com um nome de tipo.
(prn "tipo de linguagem: " (type linguagem))
(prn "tipo de ano: " (type ano))
(prn "tipo de criador: " (type criador))
(prn "tipo de versao: " (type versao))
(prn "tipo de uma lista: " (type '(1 2 3)))
(prn "ano é inteiro? " (isa ano 'int))
(prn "linguagem é string? " (isa linguagem 'string))

; Números: int é inteiro exato; num é qualquer número, inclusive racional.
; A divisão de inteiros em Arc é exata, não truncada.
(prn "7/2 como valor exato: " (/ 7 2))
(prn "7/2 truncado: " (trunc (/ 7 2)))
(prn "soma de int com num: " (+ 1 2.5))

; A atribuição também aceita vários pares nome/valor de uma vez.
(= x 1 y 2)
(prn "x + y = " (+ x y))
