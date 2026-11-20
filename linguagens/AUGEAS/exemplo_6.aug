(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_6.aug - blocos aninhados com recursao

   Uma lente pode se referir a si mesma: e assim que se descreve um
   formato hierarquico de profundidade arbitraria, como "nome { ... }".
   Em Augeas a forma e "let rec nome = ...", e a lente recursiva pode
   se citar no proprio corpo (como faz aptconf.aug).
   ===================================================================== *)

module Exemplo_6 =
  autoload xfm

(* lns descreve o conteudo de um bloco e tambem o arquivo inteiro. *)
let rec lns =
  let sep = del /[ \t]*=[ \t]*/ " = " in
  let chave = /[A-Za-z0-9_.-]+/ in
  let valor = [ Util.del_opt_ws ""
              . key chave
              . sep
              . store /[^ \t\n]+/
              . Util.eol ] in
  (* del com dois argumentos define o texto escrito ao criar a
     estrutura: a abertura " {" e o fechamento "}". *)
  let bloco = [ Util.del_opt_ws ""
              . key chave
              . del /[ \t]*\{[ \t]*\n/ " {\n"
              . lns
              . Util.del_opt_ws ""
              . del /\}[ \t]*\n/ "}\n" ] in
  ( Util.comment | Util.empty | valor | bloco )*

let filter = incl "/etc/exemplo6.conf"

let xfm = transform lns filter

test lns get "servidor {\n  host = localhost\n  porta = 8080\n}\n" =
  { "servidor" { "host" = "localhost" } { "porta" = "8080" } }

(* Dois niveis de aninhamento. *)
test lns get "a {\n  b {\n    c = 1\n  }\n}\n" =
  { "a" { "b" { "c" = "1" } } }

(* Uma chave nova dentro de um bloco existente. *)
(* A entrada criada nao herda a indentacao do arquivo: a lente
   reconhece espacos na leitura, mas nao os inventa na gravacao. *)
test lns put "raiz {\n  x = 1\n}\n" after set "raiz/y" "2" =
  "raiz {\n  x = 1\ny = 2\n}\n"
