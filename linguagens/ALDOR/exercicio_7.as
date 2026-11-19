#include "aldor"
#include "aldorio"
import from Integer;

-- Exercicio 7: rejeitar uma entrada nao positiva com excecao tipada.
define InvalidPositiveType: Category == with;
InvalidPositive: InvalidPositiveType == add;
positiveOrError(n: Integer): Integer == {
    if n > 0 then n else throw InvalidPositive;
}
result: Integer := try positiveOrError(0) catch E in {
    E has InvalidPositiveType => -1;
    true => throw E;
    never;
}
if result < 0 then stdout << "input rejected" << newline
else stdout << "input accepted" << newline
