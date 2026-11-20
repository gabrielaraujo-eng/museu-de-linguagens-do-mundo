(* ============================================================
   exemplo_6.dats - estruturas de dados: datatype, casamento de
   padrões e a lista pré-definida list0.
   ------------------------------------------------------------
   "datatype" declara uma união etiquetada. Cada construtor pode
   carregar zero ou mais valores. list0(T) é a lista persistente
   da prelude, com construtores list0_nil e list0_cons; a macro
   $list{T}(...) monta uma lista literal.
   ============================================================ *)

#include "share/atspre_staload.hats"

datatype forma =
  | Circulo of (double)
  | Retangulo of (double, double)
  | Triangulo of (double, double)

fun area (f: forma): double =
  case+ f of
  | Circulo (r) => 3.14159265358979 * r * r
  | Retangulo (b, h) => b * h
  | Triangulo (b, h) => b * h / 2.0

fun descrever (f: forma): string =
  case+ f of
  | Circulo (_) => "círculo"
  | Retangulo (_, _) => "retângulo"
  | Triangulo (_, _) => "triângulo"

(* soma dos elementos de uma lista de inteiros *)
fun soma (xs: list0(int)): int =
  case+ xs of
  | list0_nil () => 0
  | list0_cons (x, resto) => x + soma (resto)

(* conta quantas figuras de uma lista têm área maior que 5.0 *)
fun quantas_grandes (xs: list0(forma)): int =
  case+ xs of
  | list0_nil () => 0
  | list0_cons (f, resto) =>
      (if area f > 5.0 then 1 else 0) + quantas_grandes (resto)

implement main0 () = let
  val c = Circulo (1.0)
  val r = Retangulo (2.0, 3.0)
  val t = Triangulo (4.0, 5.0)
  val figuras = $list{forma} (c, r, t)
  val numeros = $list{int} (4, 8, 15, 16, 23, 42)
in
  printf ("%s: área = %f\n", descrever c, area c);
  printf ("%s: área = %f\n", descrever r, area r);
  printf ("%s: área = %f\n", descrever t, area t);
  printf ("soma da lista = %d\n", soma numeros);
  printf ("figuras com área maior que 5 = %d\n", quantas_grandes figuras)
end
