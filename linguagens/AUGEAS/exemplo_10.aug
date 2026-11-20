(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_10.aug - opcoes de linha de comando e filtro com varios
   arquivos

   Aqui a arvore nao usa o texto como nome: cada linha vira um no com o
   rotulo fixo "opcao" e o texto fica no valor. O filtro inclui o
   arquivo principal, os arquivos de um diretorio .d e exclui copias de
   backup com Util.stdexcl.
   ===================================================================== *)

module Exemplo_10 =
  autoload xfm

let opcao = [ label "opcao"
            . store /-[A-Za-z][A-Za-z0-9-]*/
            . ( Sep.space . [ label "valor" . store /[^ \t\n]+/ ] )?
            . Util.eol ]

let lns = ( Util.comment | Util.empty | opcao )*

(* Um filtro e uma concatenacao de incl/excl. *)
let filter = ( incl "/etc/exemplo10.conf" )
           . ( incl "/etc/exemplo10.d/*.conf" )
           . Util.stdexcl

let xfm = transform lns filter

test lns get "-porta 8080\n-verboso\n" =
  { "opcao" = "-porta" { "valor" = "8080" } }
  { "opcao" = "-verboso" }

test lns put "-porta 8080\n" after set "opcao[1]/valor" "9090" =
  "-porta 9090\n"

(* Acrescentar uma opcao sem argumento. *)
test lns put "-porta 8080\n" after set "opcao[2]" "-verboso" =
  "-porta 8080\n-verboso\n"
