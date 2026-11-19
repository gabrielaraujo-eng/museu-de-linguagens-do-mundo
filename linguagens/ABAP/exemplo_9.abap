* Exemplo 9: Operações Matemáticas em ABAP
* Nota numérica: TYPE f é ponto flutuante e produz resultado aproximado; não é indicação para valores financeiros.
REPORT z_math_operations.

DATA: lv_num TYPE f VALUE 16,
      lv_sqrt TYPE f.

lv_sqrt = sqrt( lv_num ).

WRITE: / 'A raiz quadrada de', lv_num, 'é', lv_sqrt.
WRITE: / 'Potência (2^3):', 2 ** 3.
