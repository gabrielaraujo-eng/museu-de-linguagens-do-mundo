#include "aldor"
#include "aldorio"
import from String;

-- Exemplo 8: concatenacao usando a operacao exportada pela String atual.
greeting: String := "Ola" + ", Mundo!";
stdout << greeting << newline
