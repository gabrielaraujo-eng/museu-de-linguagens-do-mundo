#include "aldor"
#include "aldorio"
import from Integer;

-- Exercicio 1: encontrar o maior de dois inteiros; solucao incluida.
maximum(a: Integer, b: Integer): Integer == if a > b then a else b;
stdout << "maximum(12, 7) = " << maximum(12, 7) << newline
