(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_3.aug - pares "chave: valor" (resolvido)

   Formato de fichario: "chave: valor", com dois-pontos como separador
   e valor que pode conter espacos. O separador e descartado na leitura
   e recriado como ": " na gravacao.
   ===================================================================== *)

module Exercicio_3 =
  autoload xfm

let sep = del /[ \t]*:[ \t]*/ ": "

let entrada = [ key Rx.word
              . sep
              . store /[^ \t\n][^\n]*[^ \t\n]|[^ \t\n]/
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exercicio3.cat"

let xfm = transform lns filter

test lns get "titulo: Museu de Linguagens\n" =
  { "titulo" = "Museu de Linguagens" }

test lns get "ano: 2007\nautor: Augeas\n" =
  { "ano" = "2007" }
  { "autor" = "Augeas" }

test lns put "titulo: Antigo\n" after set "titulo" "Novo titulo" =
  "titulo: Novo titulo\n"
