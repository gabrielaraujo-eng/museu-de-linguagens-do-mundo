(* ============================================================
   exemplo_3.dats - controle de fluxo: if/then/else e case
   ------------------------------------------------------------
   Em ATS2, if/then/else é uma EXPRESSÃO: os dois ramos precisam
   ter o mesmo tipo. case ... of faz casamento de padrões; com
   case+ o compilador exige que os padrões sejam exaustivos.
   ============================================================ *)

#include "share/atspre_staload.hats"

(* if/then/else como expressão que devolve string *)
fun classificar (n: int): string =
  if n > 0 then "positivo"
  else if n < 0 then "negativo"
  else "zero"

(* case sobre constantes inteiras; o padrão _ cobre o resto *)
fun nome_do_dia (d: int): string =
  case d of
  | 1 => "domingo"
  | 2 => "segunda-feira"
  | 3 => "terça-feira"
  | 4 => "quarta-feira"
  | 5 => "quinta-feira"
  | 6 => "sexta-feira"
  | 7 => "sábado"
  | _ => "dia inválido"

implement main0 () = let
  val a = 42
  val b = ~7
  val c = 0
in
  printf ("%d é %s\n", a, classificar a);
  printf ("%d é %s\n", b, classificar b);
  printf ("%d é %s\n", c, classificar c);
  printf ("dia 3 = %s\n", nome_do_dia 3);
  printf ("dia 9 = %s\n", nome_do_dia 9)
end
