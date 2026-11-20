(* ============================================================
   exercicio_9.dats - maior, menor e média de seis notas
   ------------------------------------------------------------
   Enunciado: dada uma lista de seis notas (double), calcular a
   maior, a menor e a média.
   Solução: percorrer a lista uma única vez, acumulando soma,
   máximo e mínimo, e devolver os três valores em um registro
   plano (typedef com @{...}). Assim não são necessárias três
   percorrências separadas.
   ============================================================ *)

#include "share/atspre_staload.hats"

typedef resumo = @{ soma: double, maior: double, menor: double }

(* percorre a lista acumulando os três valores *)
fun percorrer (ys: list0(double), soma: double,
               maior: double, menor: double): resumo =
  case+ ys of
  | list0_nil () => @{ soma = soma, maior = maior, menor = menor }
  | list0_cons (y, resto) =>
      percorrer (resto,
                 soma + y,
                 (if y > maior then y else maior),
                 (if y < menor then y else menor))

(* a primeira nota inicializa os três acumuladores *)
fun resumir (xs: list0(double)): resumo =
  case+ xs of
  | list0_nil () => @{ soma = 0.0, maior = 0.0, menor = 0.0 }
  | list0_cons (x, resto) => percorrer (resto, x, x, x)

implement main0 () = let
  val notas = $list{double} (7.5, 9.0, 6.0, 8.5, 10.0, 5.5)
  val r = resumir notas
in
  printf ("maior nota = %f\n", r.maior);
  printf ("menor nota = %f\n", r.menor);
  printf ("média = %f\n", r.soma / 6.0)
end
