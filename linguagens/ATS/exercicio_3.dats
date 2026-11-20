(* ============================================================
   exercicio_3.dats - classificação de um inteiro
   ------------------------------------------------------------
   Enunciado: ler um inteiro (aqui fixo no código) e dizer se é
   positivo, negativo ou zero.
   Solução: if/then/else encadeado devolvendo string, com teste
   de vários valores em sequência.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun classificar (n: int): string =
  if n > 0 then "positivo"
  else if n < 0 then "negativo"
  else "zero"

fun testar (n: int): void =
  printf ("%d -> %s\n", n, classificar n)

implement main0 () = (
  testar 17;
  testar ~4;
  testar 0;
  testar 1000
)
