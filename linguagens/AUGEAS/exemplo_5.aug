(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_5.aug - secoes no estilo INI

   O nome da secao vira o rotulo do no pai e as entradas ficam dentro
   dele. Seguimos o idioma usado pelas lentes oficiais do Augeas (por
   exemplo sshd.aug): as secoes vem depois das linhas soltas, porque
   uma repeticao dentro de outra repeticao seria ambigua para o motor.
   ===================================================================== *)

module Exemplo_5 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "

let entrada = [ key Rx.word . sep . store Rx.no_spaces . Util.eol ]

(* [secao] e, abaixo dela, apenas entradas e linhas vazias. *)
let secao = [ Util.del_str "["
            . key Rx.word
            . Util.del_str "]"
            . Util.eol
            . ( Util.empty | entrada )* ]

let lns = ( Util.comment | Util.empty | entrada )* . secao*

let filter = incl "/etc/exemplo5.ini"

let xfm = transform lns filter

test lns get "# exemplo\n[rede]\nhost = localhost\nporta = 8080\n" =
  { "#comment" = "exemplo" }
  { "rede" { "host" = "localhost" } { "porta" = "8080" } }

(* Criar uma chave dentro de uma secao existente. *)
test lns put "[rede]\nhost = localhost\n" after set "rede/porta" "8080" =
  "[rede]\nhost = localhost\nporta = 8080\n"

(* Remover a secao leva junto as entradas dela. *)
test lns put "[geral]\nidioma = pt\n[rede]\nhost = localhost\n" after rm "geral" =
  "[rede]\nhost = localhost\n"
