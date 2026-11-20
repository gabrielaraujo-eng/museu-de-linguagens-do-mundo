(* ============================================================
   exemplo_9.dats - matemática
   ------------------------------------------------------------
   ATS2 tem int (inteiro de precisão da máquina) e double, com
   aritmética sobrecarregada: +, -, *, / e as comparações
   funcionam para os dois tipos. As funções abaixo são escritas
   apenas com essa aritmética, sem depender da biblioteca
   matemática do C.
   ============================================================ *)

#include "share/atspre_staload.hats"

(* potência inteira por recursão *)
fun potencia (base: int, exp: int): int =
  if exp <= 0 then 1 else base * potencia (base, exp - 1)

(* máximo divisor comum pelo algoritmo de Euclides; o resto é
   calculado como a - (a / b) * b para ficar só com divisão *)
fun mdc (a: int, b: int): int =
  if b = 0 then a else mdc (b, a - (a / b) * b)

(* Fibonacci iterativo: três parâmetros, recursão de cauda *)
fun fib (n: int): int = aux (n, 0, 1) where
{
  fun aux (k: int, a: int, b: int): int =
    if k <= 0 then a else aux (k - 1, b, a + b)
}

(* raiz quadrada por Newton-Raphson, só com aritmética double *)
fun raiz (x: double): double = iterar (x, 1.0, 0) where
{
  fun iterar (alvo: double, aprox: double, passo: int): double =
    if passo >= 30 then aprox
    else iterar (alvo, (aprox + alvo / aprox) / 2.0, passo + 1)
}

implement main0 () = (
  printf ("2^10 = %d\n", potencia (2, 10));
  printf ("3^4 = %d\n", potencia (3, 4));
  printf ("mdc (48, 18) = %d\n", mdc (48, 18));
  printf ("fib 20 = %d\n", fib 20);
  printf ("raiz de 2.0 = %f\n", raiz (2.0));
  printf ("raiz de 144.0 = %f\n", raiz (144.0))
)
