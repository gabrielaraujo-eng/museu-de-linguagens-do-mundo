* Exercício 2: Cálculo simples com variáveis
* Nota numérica: TYPE p DECIMALS 2 é usado para a demonstração decimal; valide arredondamento no sistema ABAP.
REPORT z_exercise_2.

DATA: lv_preco TYPE p DECIMALS 2 VALUE '19.90',
      lv_qtd   TYPE i VALUE 3,
      lv_total TYPE p DECIMALS 2.

lv_total = lv_preco * lv_qtd.

WRITE: 'Preço unitário:', lv_preco,
       / 'Quantidade:', lv_qtd,
       / 'Total:', lv_total.
