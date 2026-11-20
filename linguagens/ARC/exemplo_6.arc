; exemplo_6.arc: Estruturas de dados
;
; Arc tem duas estruturas fundamentais: o par (cons), do qual derivam as
; listas, e a tabela (hash), criada com obj ou table.

; Listas são pares encadeados terminados em nil.
(= xs (list 1 2 3))
(prn "lista: " xs)
(prn "car (primeiro): " (car xs))
(prn "cdr (resto): " (cdr xs))
(= xs (cons 0 xs))
(prn "com cons na frente: " xs)
(prn "len: " (len xs))
(prn "elemento de índice 2: " (xs 2))
(prn "invertida: " (rev xs))

; Um par avulso guarda dois valores (aqui, nome e idade).
(= pessoa (cons "Ana" 30))
(prn "par: " pessoa)
(prn "nome: " (car pessoa) " | idade: " (cdr pessoa))

; Lista de associação: lista de listas de dois elementos.
; alref e cadr esperam listas próprias (não pares pontilhados como
; (cons 'porta 8080)), por isso cada entrada é montada com list.
(= config (list (list 'host "localhost") (list 'porta 8080)))
(prn "porta: " (alref config 'porta))
(each par config
  (prn "  chave: " (car par) " -> valor: " (cadr par)))

; Tabela com chaves simbólicas.
(= agenda (obj ana "1111" bruno "2222"))
(prn "telefone da ana: " (agenda 'ana))
(= (agenda 'carla) "3333")          ; inserindo uma chave nova
(prn "chaves: " (keys agenda))
(prn "valores: " (vals agenda))
(each (nome fone) agenda
  (prn "  " nome " -> " fone))

; Tabela vazia criada em tempo de execução.
(= contador (table))
(each x '(a b a c a)
  (= (contador x) (+ 1 (or (contador x) 0))))
(prn "contagem de a: " (contador 'a))
