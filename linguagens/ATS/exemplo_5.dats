(* ============================================================
   exemplo_5.dats - funções: fun, lam, tipos de função e
   funções de ordem superior.
   ------------------------------------------------------------
   "fun" introduz uma função (que pode ser recursiva); "lam"
   cria uma função anônima. O tipo int -> int é o tipo das
   funções puras de um inteiro para um inteiro e pode ser usado
   como tipo de parâmetro.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun quadrado (n: int): int = n * n

(* recursão sem acumulador: soma_ate n = n + (n-1) + ... + 1 *)
fun soma_ate (n: int): int =
  if n <= 0 then 0 else n + soma_ate (n - 1)

(* ordem superior: o primeiro parâmetro é uma função *)
fun aplicar_duas_vezes (f: int -> int, x: int): int = f (f x)

(* composição de duas funções *)
fun compor (f: int -> int, g: int -> int): int -> int =
  lam (x: int): int => f (g x)

implement main0 () = let
  val dobro = lam (x: int): int => 2 * x
  val mais_dez = lam (x: int): int => x + 10
  val dobro_depois_mais_dez = compor (mais_dez, dobro)
in
  printf ("quadrado 7 = %d\n", quadrado 7);
  printf ("soma_ate 10 = %d\n", soma_ate 10);
  printf ("duas vezes o dobro de 3 = %d\n", aplicar_duas_vezes (dobro, 3));
  printf ("dobro e depois +10, aplicado a 5 = %d\n", dobro_depois_mais_dez 5);
  printf ("quadrado aplicado duas vezes a 2 = %d\n",
          aplicar_duas_vezes (quadrado, 2))
end
