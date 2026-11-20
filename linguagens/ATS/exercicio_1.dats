(* ============================================================
   exercicio_1.dats - saída em duas linhas
   ------------------------------------------------------------
   Enunciado: escrever um programa completo em ATS2 que imprima
   duas linhas de texto, sendo a segunda o resultado de uma
   conta simples.
   Solução: main0 com uma sequência de comandos; println! para
   texto e printf para o valor numérico.
   ============================================================ *)

#include "share/atspre_staload.hats"

implement main0 () = (
  println! ("Museu de Linguagens do Mundo - pasta ATS");
  printf ("7 * 6 = %d\n", 7 * 6)
)
