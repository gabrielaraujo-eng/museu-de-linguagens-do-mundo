#include "aldor"
#include "aldorio"
import from String, Character;

-- Exercicio 8: converter cada caractere da string para minuscula.
lowered: String := map(lower)("ALDOR");
stdout << lowered << newline
