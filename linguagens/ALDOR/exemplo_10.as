#include "aldor"
#include "aldorio"
import from Integer;

-- Exemplo 10: categoria com uma operacao e dominio que a implementa.
define Scalable: Category == with {
    scale: (Integer, Integer) -> Integer;
}
ScalePair: Scalable == add {
    import from Integer;
    scale(a: Integer, b: Integer): Integer == 2 * a + b;
}
import from ScalePair;
stdout << "scale(3, 4) = " << scale(3, 4) << newline
