(* ============================================================
   exemplo_7.dats - tratamento de erros
   ------------------------------------------------------------
   ATS2 não tem exceções no estilo de Java no núcleo, mas a
   prelude oferece exceções ($raise / try ... with) e o tipo
   option(T). O idioma mais seguro, porém, é devolver um
   resultado explícito: um datatype que carrega ou o valor
   calculado, ou a descrição da falha. Assim o chamador é
   obrigado pelo typechecker a tratar os dois casos.
   assertloc é a verificação de sanidade que aborta o programa
   quando a condição é falsa.
   ============================================================ *)

#include "share/atspre_staload.hats"

datatype resultado =
  | Ok of (int)
  | Erro of (string)

fun dividir (a: int, b: int): resultado =
  if b = 0 then Erro ("divisão por zero")
  else Ok (a / b)

fun mostrar (r: resultado): void =
  case+ r of
  | Ok (v) => printf ("resultado = %d\n", v)
  | Erro (msg) => printf ("erro: %s\n", msg)

(* verificação de sanidade: interrompe a execução se falhar *)
fun media (a: int, b: int): int = let
  val soma = a + b
  val () = assertloc (soma >= 0)
in
  soma / 2
end

implement main0 () = let
  val bom = dividir (10, 2)
  val ruim = dividir (7, 0)
in
  mostrar bom;
  mostrar ruim;
  printf ("média de 8 e 4 = %d\n", media (8, 4));
  (* se a linha abaixo fosse descomentada, o programa abortaria
     com a mensagem de assertloc, pois a soma seria negativa:
     val () = assertloc (~3 >= 0) *)
  printf ("fim do programa\n")
end
