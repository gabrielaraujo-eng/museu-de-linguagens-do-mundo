(* ============================================================
   exemplo_1.dats - estrutura mínima de um programa ATS2
   ------------------------------------------------------------
   Um programa executável em ATS2 (ATS/Postiats) precisa de:

     1. a diretiva #include que carrega a "prelude" de ATS2
        (tipos básicos, aritmética sobrecarregada, printf,
        listas, opções e o runtime);
     2. uma implementação de main0, cujo tipo é () -> void.

   O compilador patsopt traduz este arquivo .dats para C; o
   script atscc chama o compilador C e o linker.
   ============================================================ *)

#include "share/atspre_staload.hats"

(* println! é uma macro da prelude: imprime o argumento e
   acrescenta uma quebra de linha. As alternativas diretas são
   print (string), prerr (string), prerrln! e printf. *)
implement main0 () = println! ("Olá, mundo! Este programa é ATS2 de verdade.")
