(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_10.aug - valores sim/nao com comentario no fim da linha
   (resolvido)

   Cada linha e "chave = sim" ou "chave = nao", opcionalmente seguida
   de um comentario. O comentario e um filho com rotulo "#comment",
   porque o valor do no ja esta ocupado pelo sim/nao.
   ===================================================================== *)

module Exercicio_10 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "
let sim_nao = /(sim|nao)/

let comentario = [ label "#comment"
                 . del /#[ \t]*/ "# "
                 . store /[^ \t\n]([^\n]*[^ \t\n])?/ ]

let entrada = [ key Rx.word
              . sep
              . store sim_nao
              . ( Sep.space . comentario )?
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio10.conf"

let xfm = transform lns filter

test lns get "cache = sim\n" = { "cache" = "sim" }

test lns get "telemetria = nao # desligado por padrao\n" =
  { "telemetria" = "nao" { "#comment" = "desligado por padrao" } }

test lns put "cache = sim\n" after set "cache" "nao" = "cache = nao\n"
