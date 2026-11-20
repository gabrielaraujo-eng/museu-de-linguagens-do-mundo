(* ============================================================
   exemplo_10.dats - algoritmo: ordenação por inserção em uma
   lista persistente, com funções auxiliares recursivas.
   ------------------------------------------------------------
   Ordenar uma lista imutável é um exercício de recursão pura:
   inserir coloca um elemento no lugar certo de uma lista já
   ordenada, e ordenar insere a cabeça na lista ordenada do
   resto. A lista original nunca é modificada.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun inserir (x: int, xs: list0(int)): list0(int) =
  case+ xs of
  | list0_nil () => list0_cons (x, list0_nil ())
  | list0_cons (y, resto) =>
      if x <= y then list0_cons (x, xs)
      else list0_cons (y, inserir (x, resto))

fun ordenar (xs: list0(int)): list0(int) =
  case+ xs of
  | list0_nil () => list0_nil ()
  | list0_cons (y, resto) => inserir (y, ordenar resto)

fun imprimir (xs: list0(int)): void =
  case+ xs of
  | list0_nil () => printf ("\n")
  | list0_cons (y, resto) => (printf ("%d ", y); imprimir resto)

(* mínimo corrente: percorre a cauda guardando o menor até agora *)
fun menor_de (ys: list0(int), atual: int): int =
  case+ ys of
  | list0_nil () => atual
  | list0_cons (z, resto) =>
      menor_de (resto, (if z < atual then z else atual))

(* menor elemento de uma lista não vazia; 0 para lista vazia *)
fun menor (xs: list0(int)): int =
  case+ xs of
  | list0_nil () => 0
  | list0_cons (y, resto) => menor_de (resto, y)

implement main0 () = let
  val desordenada = $list{int} (5, 3, 9, 1, 7, 2, 8, 6, 4, 0)
  val ordenada = ordenar desordenada
in
  printf ("original:    ");
  imprimir desordenada;
  printf ("ordenada:    ");
  imprimir ordenada;
  printf ("menor valor: %d\n", menor ordenada);
  printf ("original continua intacta: ");
  imprimir desordenada
end
