(* ============================================================
   exercicio_2.dats - conversão de Celsius para Fahrenheit
   ------------------------------------------------------------
   Enunciado: dada uma temperatura em graus Celsius, calcular a
   correspondente em Fahrenheit com F = C * 9 / 5 + 32.
   Solução: função sobre double; a divisão é feita em ponto
   flutuante porque 9.0 e 5.0 são literais double.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun celsius_para_fahrenheit (c: double): double =
  c * 9.0 / 5.0 + 32.0

implement main0 () = let
  val congelamento = 0.0
  val ambiente = 25.0
  val corpo = 36.5
in
  printf ("%f C = %f F\n", congelamento, celsius_para_fahrenheit congelamento);
  printf ("%f C = %f F\n", ambiente, celsius_para_fahrenheit ambiente);
  printf ("%f C = %f F\n", corpo, celsius_para_fahrenheit corpo)
end
