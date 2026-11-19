#include "aldor"
#include "aldorio"
import from List Integer, Integer;

-- Exercicio 6: percorrer uma lista e somar seus elementos.
numbers: List Integer := [2, 3, 5];
total: Integer := 0;
for value in numbers repeat total := total + value;
stdout << "sum([2, 3, 5]) = " << total << newline
