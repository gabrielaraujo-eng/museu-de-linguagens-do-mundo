(* ============================================================
   exemplo_4.dats - repetições: recursão de cauda e while
   ------------------------------------------------------------
   ATS2 não tem "for" no núcleo. O idioma funcional é a recursão
   de cauda com acumulador (que o compilador transforma em laço);
   o idioma imperativo é "while", que só faz sentido sobre uma
   célula declarada com "var".
   ============================================================ *)

#include "share/atspre_staload.hats"

(* recursão de cauda: o resultado da chamada recursiva é o
   resultado da função, sem trabalho pendente na volta *)
fun soma_ate (n: int): int = aux (1, 0) where
{
  fun aux (i: int, acc: int): int =
    if i > n then acc else aux (i + 1, acc + i)
}

(* while sobre uma variável local: imprime a tabuada de n *)
fun tabuada (n: int): void = let
  var i: int = 1
in
  while (i <= 10)
    (printf ("%d x %d = %d\n", n, i, n * i); i := i + 1)
end

(* contagem regressiva por recursão de cauda *)
fun regressiva (n: int): void =
  if n <= 0 then printf ("fim\n")
  else (printf ("%d ", n); regressiva (n - 1))

implement main0 () = (
  printf ("soma de 1 a 100 = %d\n", soma_ate 100);
  tabuada 3;
  regressiva 5
)
