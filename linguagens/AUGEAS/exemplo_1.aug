(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_1.aug - lente minima para um arquivo "chave = valor"

   Augeas le e escreve arquivos de configuracao por meio de "lentes":
   programas escritos nesta linguagem declarativa que descrevem, ao
   mesmo tempo, a sintaxe do arquivo e a arvore que ele representa.
   A mesma lente serve para ler (get) e para gravar (put), de modo que
   nenhuma linha do arquivo original se perde.
   ===================================================================== *)

module Exemplo_1 =
  autoload xfm

(* Uma entrada: nome, sinal de igual, valor. O valor nao pode comecar
   nem terminar com espaco, mas pode conter espacos no meio. *)
let entrada = [ key Rx.word
              . del /[ \t]*=[ \t]*/ " = "
              . store /[^ \t\n]([^\n]*[^ \t\n])?/
              . Util.eol ]

(* O arquivo e uma sequencia de comentarios, linhas vazias e entradas. *)
let lns = ( Util.comment | Util.empty | entrada )*

(* O filtro diz ao Augeas qual arquivo do sistema esta lente governa. *)
let filter = incl "/etc/exemplo1.conf"

let xfm = transform lns filter

(* Testes executados por augparse: leitura, gravacao e remocao. *)
test lns get "nome = museu\n" = { "nome" = "museu" }
test lns get "# comentario\nnome = museu\n" = { "#comment" = "comentario" } { "nome" = "museu" }
test lns put "nome = museu\n" after set "nome" "augeas" = "nome = augeas\n"
test lns put "nome = museu\n" after rm "nome" = ""
