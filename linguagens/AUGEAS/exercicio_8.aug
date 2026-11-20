(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_8.aug - registro com campos separados por dois-pontos
   (resolvido), no estilo de /etc/passwd

   O primeiro campo e o nome do no; os demais sao filhos numerados por
   seq. Campos vazios sao permitidos, porque o regexp aceita zero
   caracteres entre dois separadores.
   ===================================================================== *)

module Exercicio_8 =
  autoload xfm

let campo = /([^:\n]*[^: \t\n])?/
let dois_pontos = Util.del_str ":"

let entrada = [ key /[A-Za-z0-9_.-]+/
              . dois_pontos . store campo
              . ( dois_pontos . [ seq "campo" . store campo ] )*
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio8.passwd"

let xfm = transform lns filter

test lns get "ana:x:1000:1000:Ana:/home/ana:/bin/sh\n" =
  { "ana" = "x"
    { "1" = "1000" } { "2" = "1000" } { "3" = "Ana" }
    { "4" = "/home/ana" } { "5" = "/bin/sh" } }

(* Campo vazio entre dois separadores. *)
test lns get "bob::1001:1001::/home/bob:/bin/sh\n" =
  { "bob" = ""
    { "1" = "1001" } { "2" = "1001" } { "3" = "" }
    { "4" = "/home/bob" } { "5" = "/bin/sh" } }

test lns put "ana:x:1000:1000:Ana:/home/ana:/bin/sh\n" after set "ana/3" "Ana Maria" =
  "ana:x:1000:1000:Ana Maria:/home/ana:/bin/sh\n"
