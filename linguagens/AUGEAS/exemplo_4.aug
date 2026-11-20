(* =====================================================================
   Museu de Linguagens do Mundo - AUGEAS
   exemplo_4.aug - listas: seq para linhas, label para valores

   A arvore do Augeas nao tem "arrays": irmaos com o mesmo nome sao
   apenas nos repetidos. seq produz rotulos numerados (1, 2, 3, ...) e
   label produz um rotulo fixo que se repete a cada ocorrencia.
   ===================================================================== *)

module Exemplo_4 =
  autoload xfm

let palavra = /[A-Za-z0-9_.-]+/

(* Linha sem nome: cada ocorrencia recebe o rotulo numerado "item". *)
let item = [ seq "item" . store palavra . Util.eol ]

(* Linha com nome e varios valores: o valor do no e o primeiro campo,
   os demais viram filhos com o rotulo repetido "nome". *)
let linha = [ key palavra
            . Util.del_str ":"
            . ( Sep.space . [ label "nome" . store palavra ] )+
            . Util.eol ]

let lns = ( Util.comment | Util.empty | linha | item )*

let filter = incl "/etc/exemplo4.lst"

let xfm = transform lns filter

(* seq gera rotulos numerados: 1, 2, 3 ... *)
test lns get "alfa\nbeta\n" =
  { "1" = "alfa" }
  { "2" = "beta" }

test lns get "grupo: ana bruno carla\n" =
  { "grupo" { "nome" = "ana" } { "nome" = "bruno" } { "nome" = "carla" } }

(* Acrescentar um valor ao fim da lista de um grupo. *)
test lns put "grupo: ana bruno\n" after set "grupo/nome[3]" "carla" =
  "grupo: ana bruno carla\n"

(* Remover o segundo item nao afeta o primeiro. *)
test lns put "alfa\nbeta\ngama\n" after rm "*[2]" =
  "alfa\ngama\n"
