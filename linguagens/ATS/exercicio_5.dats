(* ============================================================
   exercicio_5.dats - fatorial e coeficiente binomial
   ------------------------------------------------------------
   Enunciado: escrever uma função recursiva que calcule n! e
   usá-la para calcular o coeficiente binomial C(n, k).
   Solução: fatorial por recursão simples e binomial pela
   fórmula n! / (k! * (n-k)!). Os testes usam valores pequenos
   para não estourar o inteiro de máquina.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun fatorial (n: int): int =
  if n <= 1 then 1 else n * fatorial (n - 1)

fun binomial (n: int, k: int): int =
  if k < 0 then 0
  else if k > n then 0
  else fatorial n / (fatorial k * fatorial (n - k))

implement main0 () = (
  printf ("5! = %d\n", fatorial 5);
  printf ("10! = %d\n", fatorial 10);
  printf ("C(5, 2) = %d\n", binomial (5, 2));
  printf ("C(10, 3) = %d\n", binomial (10, 3));
  printf ("C(6, 6) = %d\n", binomial (6, 6));
  printf ("C(3, 7) = %d\n", binomial (3, 7))
)
