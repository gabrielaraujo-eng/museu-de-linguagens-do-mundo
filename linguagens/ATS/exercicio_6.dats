(* ============================================================
   exercicio_6.dats - inversão de uma lista de cinco posições
   ------------------------------------------------------------
   Enunciado: inverter uma lista de cinco elementos inteiros.
   Solução: percorrer a lista empilhando cada elemento na frente
   de um acumulador (é a definição de reverse para listas
   persistentes) e imprimir original e invertida.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun inverter (xs: list0(int)): list0(int) = aux (xs, list0_nil ()) where
{
  fun aux (restante: list0(int), acc: list0(int)): list0(int) =
    case+ restante of
    | list0_nil () => acc
    | list0_cons (x, resto) => aux (resto, list0_cons (x, acc))
}

fun imprimir (xs: list0(int)): void =
  case+ xs of
  | list0_nil () => printf ("\n")
  | list0_cons (x, resto) => (printf ("%d ", x); imprimir resto)

implement main0 () = let
  val original = $list{int} (10, 20, 30, 40, 50)
  val invertida = inverter original
in
  printf ("original:  ");
  imprimir original;
  printf ("invertida: ");
  imprimir invertida
end
