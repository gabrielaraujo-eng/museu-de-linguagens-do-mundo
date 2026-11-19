#include "aldor"
#include "aldorio"
import from Boolean;

-- Exercicio 2: combinar duas condicoes booleanas.
ready: Boolean := true;
hasInput: Boolean := false;
if ready and not hasInput then stdout << "ready for input" << newline
else stdout << "check state" << newline
