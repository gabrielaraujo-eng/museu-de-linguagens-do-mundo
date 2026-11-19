#include "aldor"
#include "aldorio"
import from Integer, String;

-- Exercicio 3: classificar um inteiro como positivo, zero ou negativo.
classify(n: Integer): String == {
    if n > 0 then "positive"
    else if n = 0 then "zero"
    else "negative"
}
stdout << classify(-3) << newline
