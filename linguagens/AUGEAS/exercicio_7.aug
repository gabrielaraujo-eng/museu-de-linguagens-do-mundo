(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_7.aug - registro com campos separados por barra (resolvido)

   Formato: "codigo|valor|descricao". O valor e o valor do no; a
   descricao, que pode estar vazia, e um filho com rotulo proprio.
   ===================================================================== *)

module Exercicio_7 =
  autoload xfm

let campo = /[^|\n]*[^| \t\n]|[^| \t\n]/
let campo_vazio = /([^|\n]*[^| \t\n])?/

let entrada = [ key /[A-Za-z0-9_.-]+/
              . Util.del_str "|"
              . store campo
              . Util.del_str "|"
              . [ label "descricao" . store campo_vazio ]
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio7.dat"

let xfm = transform lns filter

test lns get "A01|42|primeiro registro\n" =
  { "A01" = "42" { "descricao" = "primeiro registro" } }

(* Descricao vazia: as duas barras continuam no arquivo. *)
test lns get "B02|0|\n" =
  { "B02" = "0" { "descricao" = "" } }

test lns put "A01|42|primeiro registro\n" after set "A01/descricao" "revisado" =
  "A01|42|revisado\n"
