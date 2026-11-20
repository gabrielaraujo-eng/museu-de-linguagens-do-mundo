(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_7.aug - diretivas com valor opcional

   Muitos arquivos aceitam "quiet" e tambem "quiet = sim". Na arvore,
   o primeiro caso e um no sem valor e o segundo um no com valor: a
   diferenca e estrutural, nao textual.
   ===================================================================== *)

module Exemplo_7 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "
let palavra = /[A-Za-z0-9_.-]+/

(* ( sep . store ... )? torna o valor opcional. *)
let diretiva = [ key palavra
               . ( sep . store palavra )?
               . Util.eol ]

let lns = ( Util.comment | Util.empty | diretiva )*

let filter = incl "/etc/exemplo7.conf"

let xfm = transform lns filter

test lns get "quiet\nlog = syslog\n" =
  { "quiet" }
  { "log" = "syslog" }

(* Dar valor a uma diretiva que era apenas uma bandeira. *)
test lns put "quiet\n" after set "quiet" "sim" = "quiet = sim\n"

(* Tirar o valor devolve a forma de bandeira: clear apaga o valor e
   conserva o no; rm apagaria o no inteiro. *)
test lns put "log = syslog\n" after clear "log" = "log\n"
