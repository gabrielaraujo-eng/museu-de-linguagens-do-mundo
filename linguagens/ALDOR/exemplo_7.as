#include "aldor"
#include "aldorio"
import from Integer;

-- Exemplo 7: uma excecao definida e tratada explicitamente.
define ExampleFailureType: Category == with;
ExampleFailure: ExampleFailureType == add;
failForDemo(): Integer == throw ExampleFailure;
result: Integer := try failForDemo() catch E in {
    E has ExampleFailureType => -1;
    true => throw E;
    never;
}
if result < 0 then stdout << "handled expected exception" << newline
else stdout << "unexpected result" << newline
