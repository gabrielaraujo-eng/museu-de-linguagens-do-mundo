#include "aldor"
#include "aldorio"
import from Integer;

-- Exemplo 3: selecao condicional com dois ramos.
score: Integer := 7;
if score > 5 then stdout << "Maior que 5" << newline
else stdout << "Menor ou igual a 5" << newline
