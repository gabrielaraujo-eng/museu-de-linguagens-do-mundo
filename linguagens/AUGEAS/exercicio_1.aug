(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exercicio_1.aug - lente para /etc/hosts (resolvido)

   Formato: "endereco nome [apelido ...]", uma entrada por linha, com
   comentarios iniciados por #. O endereco e a chave do no e cada nome
depois dele vira um filho com rotulo "nome".
   ===================================================================== *)

module Exercicio_1 =
  autoload xfm

let ip = /[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/
let nome = /[A-Za-z0-9_.-]+/

(* O endereco e a chave do no: e o que identifica a entrada. *)
let entrada = [ key ip
              . ( Sep.space . [ label "nome" . store nome ] )+
              . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/hosts"

let xfm = transform lns filter

test lns get "127.0.0.1 localhost\n" =
  { "127.0.0.1" { "nome" = "localhost" } }

test lns get "# local\n10.0.0.5 museu servidor\n" =
  { "#comment" = "local" }
  { "10.0.0.5" { "nome" = "museu" } { "nome" = "servidor" } }

(* Acrescentar um apelido a uma entrada existente. *)
test lns put "127.0.0.1 localhost\n" after set "*[1]/nome[2]" "museu" =
  "127.0.0.1 localhost museu\n"
