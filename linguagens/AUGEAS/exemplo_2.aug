(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_2.aug - comentarios, linhas vazias e tipos de linha

   Todo arquivo de configuracao real tem "ruido": comentarios e linhas
   em branco. Uma lente precisa consumir esse ruido para nao falhar na
   leitura, e precisa devolve-lo na gravacao para nao destruir o
   arquivo. Util.comment, Util.empty e Util.comment_or_eol fazem isso.
   ===================================================================== *)

module Exemplo_2 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "

(* store Rx.no_spaces: valor sem espacos nem tabulacoes. *)
let entrada = [ key Rx.word . sep . store Rx.no_spaces . Util.eol ]

(* Util.comment e Util.empty cobrem as linhas que nao sao dados.
   Evitamos Util.comment_or_eol aqui: ele aceita tambem a forma sem
   no (uma lente so de del), o que torna a repeticao ambigua. *)
let lixo = Util.comment | Util.empty

let lns = ( lixo | entrada )*

let filter = incl "/etc/exemplo2.conf"

let xfm = transform lns filter

test lns get "# arquivo de exemplo\nchave = valor\n" =
  { "#comment" = "arquivo de exemplo" }
  { "chave" = "valor" }

test lns get "a = 1\n\nb = 2\n" =
  { "a" = "1" }
  { }
  { "b" = "2" }

(* Gravar uma chave nova preserva comentarios e linhas vazias. *)
test lns put "# arquivo de exemplo\na = 1\n\nb = 2\n" after set "c" "3" =
  "# arquivo de exemplo\na = 1\n\nb = 2\nc = 3\n"
