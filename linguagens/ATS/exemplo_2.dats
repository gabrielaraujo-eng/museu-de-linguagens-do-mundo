(* ============================================================
   exemplo_2.dats - valores imutáveis (val), variáveis (var)
   e os tipos básicos int, double, bool e string.
   ------------------------------------------------------------
   Em ATS2, "val" cria uma ligação imutável e "var" cria uma
   célula mutável na pilha, cujo conteúdo muda com :=.
   Não existe atribuição sobre um "val": o compilador rejeita.
   ============================================================ *)

#include "share/atspre_staload.hats"

implement main0 () = let
  (* ligações imutáveis, com anotação de tipo explícita *)
  val nome: string = "ATS2"
  val ano: int = 2003
  val pi: double = 3.14159
  val ativa: bool = true

  (* células mutáveis: a leitura dispensa operador de desreferência *)
  var contador: int = 10
  var temperatura: double = 21.5
in
  contador := contador + 5;
  temperatura := temperatura - 1.5;

  printf ("linguagem: %s\n", nome);
  printf ("ano de criação: %d\n", ano);
  printf ("pi = %f\n", pi);
  (* bool não tem diretiva própria de impressão: convertemos para string *)
  printf ("ativa = %s\n", (if ativa then "sim" else "não"));
  printf ("contador = %d\n", contador);
  printf ("temperatura = %f\n", temperatura)
end
