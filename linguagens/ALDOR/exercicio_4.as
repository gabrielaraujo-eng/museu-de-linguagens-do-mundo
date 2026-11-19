#include "aldor"
#include "aldorio"
import from Integer;

-- Exercicio 4: contagem regressiva com while.
countdown: Integer := 3;
while countdown > 0 repeat {
    stdout << countdown << newline;
    countdown := countdown - 1;
}
stdout << "done" << newline
