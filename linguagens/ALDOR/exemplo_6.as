#include "aldor"
#include "aldorio"
import from Array Integer, Integer, MachineInteger;

-- Exemplo 6: Array e indexado a partir de zero nesta implementacao.
numbers: Array Integer := [1, 2, 3];
stdout << "numbers[0] = " << numbers(0::MachineInteger) << newline;
stdout << "numbers[1] = " << numbers(1::MachineInteger) << newline
