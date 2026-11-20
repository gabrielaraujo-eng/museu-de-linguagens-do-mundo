(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_9.aug - lista entre colchetes (resolvido)

   Formato: "cores [ azul, verde ]". Os colchetes pertencem a lente e
   nao a arvore; os valores viram filhos repetidos com rotulo "item".
   ===================================================================== *)

module Exercicio_9 =
  autoload xfm

let virgula = del /[ \t]*,[ \t]*/ ", "
let valor = /[^] \t,\n]([^],\n]*[^] \t,\n])?/

let item = [ label "item" . store valor ]

(* Os colchetes sao delimitadores: del_str para os proprios
   caracteres e del com padrao para o espaco interno. *)
let abre = del /[ \t]*/ " " . Util.del_str "[" . del /[ \t]*/ " "
let fecha = del /[ \t]*/ " " . Util.del_str "]"

let lista = [ key Rx.word
            . abre
            . item . ( virgula . item )*
            . fecha
            . Util.eol ]

let lns = ( Util.comment | Util.empty | lista )*

let filter = incl "/etc/exercicio9.list"

let xfm = transform lns filter

test lns get "cores [ azul, verde ]\n" =
  { "cores" { "item" = "azul" } { "item" = "verde" } }

test lns get "idiomas [ pt, en ]\n" =
  { "idiomas" { "item" = "pt" } { "item" = "en" } }

(* Acrescentar um valor no fim da lista. *)
test lns put "cores [ azul ]\n" after set "cores/item[2]" "verde" =
  "cores [ azul, verde ]\n"
