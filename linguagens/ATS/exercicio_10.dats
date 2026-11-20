(* ============================================================
   exercicio_10.dats - números primos até N
   ------------------------------------------------------------
   Enunciado: listar os primos menores ou iguais a 50 e contar
   quantos são.
   Solução: teste de primalidade por divisão tentativa, com
   recursão de cauda; um contador acumulado percorre o
   intervalo 2..n. O divisor candidato nunca passa de n/2,
   o que basta para a divisão tentativa.
   ============================================================ *)

#include "share/atspre_staload.hats"

(* verifica se n tem algum divisor entre 2 e n/2 *)
fun tem_divisor (n: int, d: int): bool =
  if d > n / 2 then false
  else if n - (n / d) * d = 0 then true
  else tem_divisor (n, d + 1)

fun eh_primo (n: int): bool =
  if n < 2 then false else not (tem_divisor (n, 2))

fun listar (i: int, limite: int, contador: int): int =
  if i > limite then contador
  else if eh_primo i then
    (printf ("%d ", i); listar (i + 1, limite, contador + 1))
  else listar (i + 1, limite, contador)

implement main0 () = let
  val total = listar (2, 50, 0)
in
  printf ("\nprimos até 50: %d\n", total)
end
