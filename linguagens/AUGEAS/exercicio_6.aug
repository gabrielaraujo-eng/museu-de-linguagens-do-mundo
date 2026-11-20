(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_6.aug - lente para crontab (resolvido)

   Cinco campos de tempo e o comando no fim da linha. O comando consome
   o resto da linha, inclusive espacos.
   ===================================================================== *)

module Exercicio_6 =
  autoload xfm

let tempo = /[0-9*,\/-]+/
let campo (rotulo:string) = [ label rotulo . store tempo ]

let entrada = [ seq "linha"
              . campo "minuto" . Sep.space
              . campo "hora" . Sep.space
              . campo "dia" . Sep.space
              . campo "mes" . Sep.space
              . campo "semana" . Sep.space
              . [ label "comando" . store /[^ \t\n][^\n]*[^ \t\n]|[^ \t\n]/ ]
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/crontab"

let xfm = transform lns filter

test lns get "30 2 * * * /usr/bin/backup --todos\n" =
  { "1" { "minuto" = "30" } { "hora" = "2" } { "dia" = "*" }
        { "mes" = "*" } { "semana" = "*" }
        { "comando" = "/usr/bin/backup --todos" } }

test lns get "*/15 * * * 1-5 rodar.sh\n" =
  { "1" { "minuto" = "*/15" } { "hora" = "*" } { "dia" = "*" }
        { "mes" = "*" } { "semana" = "1-5" }
        { "comando" = "rodar.sh" } }

test lns put "30 2 * * * /usr/bin/backup\n" after set "*[1]/hora" "3" =
  "30 3 * * * /usr/bin/backup\n"
