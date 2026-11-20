(* ============================================================
   exemplo_8.dats - manipulação de strings
   ------------------------------------------------------------
   O tipo string de ATS2 é uma string no estilo C (terminada por
   NUL) acrescida do comprimento conhecido em tempo de execução.
   A prelude oferece string_length, string_append e a família
   string0_*; printf com %s imprime o conteúdo sem as aspas.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun comprimento (s: string): int = string_length (s)

(* repete s n vezes, concatenando da direita para a esquerda *)
fun repetir (s: string, n: int): string =
  if n <= 0 then "" else string_append (s, repetir (s, n - 1))

(* monta uma saudação: demonstra string como parâmetro e retorno *)
fun saudacao (nome: string): string =
  string_append (string_append ("Olá, ", nome), "! Como vai?")

implement main0 () = let
  val ola = "Olá"
  val mundo = ", mundo"
  val frase = string_append (ola, mundo)
in
  printf ("frase = %s\n", frase);
  printf ("comprimento de \"%s\" = %d\n", frase, comprimento frase);
  printf ("repetição de \"ab\" 3 vezes = %s\n", repetir ("ab", 3));
  printf ("%s\n", saudacao ("ATS2"));
  print ("esta linha foi escrita com print, sem quebra automática\n")
end
