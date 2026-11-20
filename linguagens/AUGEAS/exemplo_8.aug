(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_8.aug - lentes prontas: Build.key_value_line e Sep

   O Augeas traz bibliotecas de lentes auxiliares. Build.key_value_line
   monta "chave separador valor fim-de-linha" em uma unica chamada, e
   Sep fornece os separadores usuais. Escrever a lente assim e o mesmo
   que escrever as partes na mao, com menos ruido.
   ===================================================================== *)

module Exemplo_8 =
  autoload xfm

(* Build.key_value_line : regexp -> lens -> lens -> lens
   recebe o regexp da chave, a lente do separador e a lente do valor. *)
let entrada = Build.key_value_line Rx.word Sep.space_equal (store Rx.no_spaces)

(* Build.flag_line: linha com chave e nada mais. *)
let bandeira = Build.flag_line /[A-Za-z][A-Za-z0-9_-]*/

let lns = ( Util.comment | Util.empty | entrada | bandeira )*

let filter = incl "/etc/exemplo8.conf"

let xfm = transform lns filter

test lns get "porta = 8080\n" = { "porta" = "8080" }

test lns get "verboso\n" = { "verboso" }

test lns put "porta = 8080\n" after set "porta" "9090" = "porta = 9090\n"

(* Chave nova: o separador e recriado por Sep.space_equal. *)
test lns put "porta = 8080\n" after set "host" "localhost" =
  "porta = 8080\nhost = localhost\n"
