(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_3.aug - valores entre aspas

   Formato: uma entrada por linha, "chave = \"texto\"". As aspas sao
   sintaxe, nao dado: Util.del_str as descarta na leitura e as recria na
   gravacao, de modo que a arvore guarda apenas o texto.
   ===================================================================== *)

module Exemplo_3 =
  autoload xfm

let sep = del /[ \t]*=[ \t]*/ " = "

(* Conteudo entre aspas: qualquer caractere que nao seja aspas nem fim
   de linha. Sequencias de escape nao sao interpretadas (ver limitacoes
   no README): o texto fica guardado exatamente como esta. *)
let texto = Util.del_str "\""
          . store /[^"\n]*/
          . Util.del_str "\""

let entrada = [ key Rx.word . sep . texto . Util.eol ]

let lns = ( Util.comment | Util.empty | entrada )*

let filter = incl "/etc/exemplo3.conf"

let xfm = transform lns filter

test lns get "titulo = \"Museu de Linguagens\"\n" =
  { "titulo" = "Museu de Linguagens" }

(* Valor vazio tambem e valido: as aspas existem, o conteudo nao. *)
test lns get "vazio = \"\"\n" = { "vazio" = "" }

(* Um sustenido dentro das aspas nao e comentario. *)
test lns get "cor = \"#336699\"\n" = { "cor" = "#336699" }

test lns put "titulo = \"antigo\"\n" after set "titulo" "novo titulo" =
  "titulo = \"novo titulo\"\n"
