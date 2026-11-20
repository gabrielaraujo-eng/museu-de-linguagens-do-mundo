(* ============================================================
   exercicio_8.dats - strings recebidas como parâmetros
   ------------------------------------------------------------
   Enunciado: escrever uma função que receba nome e sobrenome
   como strings e devolva a apresentação formatada; imprimir a
   lista de convidados.
   Solução: string é um tipo comum em ATS2, aceito como
   parâmetro e como resultado; a concatenação usa string_append
   e a impressão usa printf com %s.
   ============================================================ *)

#include "share/atspre_staload.hats"

fun apresentar (nome: string, sobrenome: string): string =
  string_append (string_append (sobrenome, ", "), nome)

fun convidar (nome: string, sobrenome: string): void =
  printf ("convite para %s (nome com %d caracteres)\n",
          apresentar (nome, sobrenome), string_length nome)

implement main0 () = (
  convidar ("Ada", "Lovelace");
  convidar ("Alan", "Turing");
  convidar ("Grace", "Hopper")
)
