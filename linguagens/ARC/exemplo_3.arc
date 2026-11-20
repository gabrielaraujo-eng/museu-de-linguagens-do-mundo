; exemplo_3.arc: Controle de fluxo
;
; Arc usa if para seleção. A forma geral é
;   (if teste1 valor1 teste2 valor2 ... valor-final)
; onde o último argumento, quando sobra um, é o caso contrário.
; Só nil (a lista vazia) é falso: 0 e "" são verdadeiros.

(= nota 7)

; if com as duas vias clássicas.
(if (>= nota 6)
    (prn "aprovado")
    (prn "reprovado"))

; if com várias vias.
(if (< nota 5)  (prn "conceito: insuficiente")
    (< nota 7)  (prn "conceito: regular")
    (< nota 9)  (prn "conceito: bom")
                (prn "conceito: excelente"))

; when executa o corpo somente se o teste for verdadeiro.
(when (>= nota 7)
  (prn "when: a nota atingiu o limite"))

; unless é o inverso de when.
(unless (>= nota 7)
  (prn "unless: esta linha não deve aparecer"))

; Verdade e falsidade em Arc.
(prn "0 é verdadeiro? " (if 0 "sim" "não"))
(prn "string vazia é verdadeira? " (if "" "sim" "não"))
(prn "nil é verdadeiro? " (if nil "sim" "não"))
(prn "(no nil) = " (no nil))

; case compara com is; as chaves são símbolos escritos sem aspas.
(each op '(somar subtrair dobrar)
  (case op
    somar    (prn "somar: " (+ 2 3))
    subtrair (prn "subtrair: " (- 5 2))
    (prn "operação desconhecida: " op)))

; iflet liga o resultado de uma expressão e só executa o "then" se ele
; não for nil.
(iflet primeiro-par (find even '(3 5 8 9))
  (prn "primeiro par da lista: " primeiro-par)
  (prn "a lista não tem números pares"))
