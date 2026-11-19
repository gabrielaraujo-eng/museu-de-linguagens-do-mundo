#include "aldor"
#include "aldorio"

-- Exercicio 10: estender Integer com um predicado de positividade.
define Positivity: Category == with {
    isPositive: % -> Boolean;
}
extend Integer: Positivity == add {
    isPositive(n: %): Boolean == n > 0;
}
import from Integer;
if isPositive 10 then stdout << "10 is positive" << newline
else stdout << "10 is not positive" << newline
