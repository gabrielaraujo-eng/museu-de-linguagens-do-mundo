(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_2.aug - lente para /etc/fstab (resolvido)

   Seis campos separados por espacos ou tabulacoes. Cada campo vira um
   filho com rotulo proprio, dentro de uma entrada numerada por seq.
   ===================================================================== *)

module Exercicio_2 =
  autoload xfm

let campo (rotulo:string) = [ label rotulo . store /[^ \t\n]+/ ]

(* O primeiro campo nao pode comecar com #, que seria um comentario. *)
let primeiro = [ label "dispositivo" . store /[^# \t\n][^ \t\n]*/ ]

let entrada = [ seq "linha"
              . primeiro . Sep.space
              . campo "ponto" . Sep.space
              . campo "tipo" . Sep.space
              . campo "opcoes" . Sep.space
              . campo "dump" . Sep.space
              . campo "passo"
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/fstab"

let xfm = transform lns filter

test lns get "/dev/sda1 / ext4 defaults 0 1\n" =
  { "1" { "dispositivo" = "/dev/sda1" }
        { "ponto" = "/" }
        { "tipo" = "ext4" }
        { "opcoes" = "defaults" }
        { "dump" = "0" }
        { "passo" = "1" } }

(* Tabulacoes tambem servem como separador. *)
test lns get "/dev/sdb1\t/dados\txfs\tdefaults\t0\t2\n" =
  { "1" { "dispositivo" = "/dev/sdb1" }
        { "ponto" = "/dados" }
        { "tipo" = "xfs" }
        { "opcoes" = "defaults" }
        { "dump" = "0" }
        { "passo" = "2" } }

test lns put "/dev/sda1 / ext4 defaults 0 1\n" after set "*[1]/opcoes" "noatime" =
  "/dev/sda1 / ext4 noatime 0 1\n"
