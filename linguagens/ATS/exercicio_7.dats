(* ============================================================
   exercicio_7.dats - divisão protegida contra divisor nulo
   ------------------------------------------------------------
   Enunciado: implementar uma divisão inteira que não aborte o
   programa quando o divisor é zero, informando o problema.
   Solução: a função devolve um valor padrão (sentinela) em vez
   de dividir por zero, e o chamador verifica o caso. Uma
   variável local conta quantas falhas ocorreram. Não há
   exceções: a proteção é explícita, testada com if.
   ============================================================ *)

#include "share/atspre_staload.hats"

(* devolve o quociente, ou o valor padrão quando b é zero *)
fun quociente (a: int, b: int, padrao: int): int =
  if b = 0 then padrao else a / b

fun relatar (a: int, b: int, r: int): void =
  if b = 0 then
    printf ("%d / %d: divisor nulo, devolvido o padrão %d\n", a, b, r)
  else
    printf ("%d / %d = %d\n", a, b, r)

implement main0 () = let
  var falhas: int = 0
  val r1 = quociente (20, 4, ~1)
  val r2 = quociente (7, 0, ~1)
  val r3 = quociente (9, 3, ~1)
in
  relatar (20, 4, r1);
  relatar (7, 0, r2);
  relatar (9, 3, r3);
  if r2 = ~1 then falhas := falhas + 1 else ();
  if r1 = ~1 then falhas := falhas + 1 else ();
  printf ("falhas contabilizadas: %d\n", falhas)
end
