(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_5.aug - lista de valores separados por virgula (resolvido)

   Formato: "chave = valor, valor, valor". O separador e uma virgula
   com espacos opcionais; cada valor vira um filho com rotulo "item".
   ===================================================================== *)

module Exercicio_5 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "
let virgula = del /[ \t]*,[ \t]*/ ", "
let valor = /[^, \t\n]+/

let item = [ label "item" . store valor ]

let entrada = [ key Rx.word . sep . item . ( virgula . item )* . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio5.lst"

let xfm = transform lns filter

test lns get "cores = azul, verde, vermelho\n" =
  { "cores" { "item" = "azul" } { "item" = "verde" } { "item" = "vermelho" } }

test lns get "unico = azul\n" =
  { "unico" { "item" = "azul" } }

(* Remover um valor do meio da lista. *)
test lns put "cores = azul, verde, vermelho\n" after rm "cores/item[2]" =
  "cores = azul, vermelho\n"
