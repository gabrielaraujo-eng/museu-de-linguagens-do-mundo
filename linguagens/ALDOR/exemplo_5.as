#include "aldor"
#include "aldorio"
import from Integer;

-- Exemplo 5: duas funcoes tipadas e chamadas de demonstracao.
square(x: Integer): Integer == x * x;
sumTwo(a: Integer, b: Integer): Integer == a + b;
stdout << "square(5) = " << square 5 << newline;
stdout << "sumTwo(3, 4) = " << sumTwo(3, 4) << newline
