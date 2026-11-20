(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_9.aug - numeros, valores fixos e del com dois argumentos

   Rx.decimal aceita inteiros e decimais. Quando o texto e sempre o
   mesmo, a lente usa del com valor padrao: nao ha no de valor na
   arvore, e o texto e reescrito igual ao original.
   ===================================================================== *)

module Exemplo_9 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "

(* store Rx.decimal: valor numerico guardado como texto. *)
let numero = [ key Rx.word . sep . store Rx.decimal . Util.eol ]

(* Valor fixo: a arvore tem o no "escala", sem valor; o texto "100"
   pertence a lente e volta na gravacao. *)
let fixo = [ key "escala" . Sep.space . del /[0-9]+/ "100" . Util.eol ]

let lns = ( Util.comment | Util.empty | numero | fixo )*

let filter = incl "/etc/exemplo9.conf"

let xfm = transform lns filter

test lns get "limite = 42\ntaxa = 0.75\nescala 100\n" =
  { "limite" = "42" }
  { "taxa" = "0.75" }
  { "escala" }

(* Gravar outro numero continua sendo numero para a lente. *)
test lns put "taxa = 0.75\n" after set "taxa" "1.5" = "taxa = 1.5\n"

(* Criar a linha de valor fixo nao pede valor. *)
test lns put "limite = 42\n" after set "escala" "" = "limite = 42\nescala 100\n"
