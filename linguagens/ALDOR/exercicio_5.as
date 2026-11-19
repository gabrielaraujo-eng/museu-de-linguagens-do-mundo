#include "aldor"
#include "aldorio"
import from Integer;

-- Exercicio 5: soma tipada de dois inteiros.
sumIntegers(a: Integer, b: Integer): Integer == a + b;
stdout << "sum(8, 5) = " << sumIntegers(8, 5) << newline
