#include "aldor"
#include "aldorio"
import from DoubleFloat, Integer;

-- Exemplo 9: aproximacao da raiz quadrada pelo metodo de Newton.
sqrtApprox(x: DoubleFloat): DoubleFloat == {
    r: DoubleFloat := x;
    for i in 1..7 repeat r := (r * r + x) / (2.0 * r);
    r
}
rootApprox: DoubleFloat := sqrtApprox(16.0);
if abs(rootApprox - 4.0) < 0.000001 then
    stdout << "sqrt(16) ~= 4" << newline
else
    stdout << "unexpected approximation" << newline
