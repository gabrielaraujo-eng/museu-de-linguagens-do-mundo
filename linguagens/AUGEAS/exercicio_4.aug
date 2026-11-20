(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_4.aug - "servidor = host:porta" (resolvido)

   Cada linha tem um rotulo fixo "servidor" e dois filhos: "host" e
   "porta". O dois-pontos entre eles e sintaxe e nao aparece na arvore.
   ===================================================================== *)

module Exercicio_4 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "
let host = /[A-Za-z0-9.-]+/

let entrada = [ key "servidor"
              . sep
              . [ label "host" . store host ]
              . Util.del_str ":"
              . [ label "porta" . store /[0-9]+/ ]
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio4.srv"

let xfm = transform lns filter

test lns get "servidor = localhost:8080\n" =
  { "servidor" { "host" = "localhost" } { "porta" = "8080" } }

test lns get "servidor = museu.org:443\nservidor = backup.org:22\n" =
  { "servidor" { "host" = "museu.org" } { "porta" = "443" } }
  { "servidor" { "host" = "backup.org" } { "porta" = "22" } }

test lns put "servidor = localhost:8080\n" after set "servidor[1]/porta" "9090" =
  "servidor = localhost:9090\n"
