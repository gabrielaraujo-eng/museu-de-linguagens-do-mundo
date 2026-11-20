(* ============================================================
   exercicio_4.dats - soma dos números pares de 1 a 20
   ------------------------------------------------------------
   Enunciado: somar os inteiros pares do intervalo fechado 1..20.
   Solução: recursão de cauda com acumulador; o passo é 2, então
   a função visita apenas os pares. O resultado é conferido
   contra a fórmula 2 + 4 + ... + 20 = 110.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun soma_pares (limite: int): int = aux (2, 0) where
{
  fun aux (i: int, acc: int): int =
    if i > limite then acc else aux (i + 2, acc + i)
}

implement main0 () = (
  printf ("soma dos pares de 1 a 20 = %d\n", soma_pares 20);
  printf ("soma dos pares de 1 a 100 = %d\n", soma_pares 100)
)
