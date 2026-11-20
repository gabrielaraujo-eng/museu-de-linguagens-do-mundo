# exemplo_2.ampl: conjuntos, parametros indexados e bloco de dados
#
# Tema: mix de producao.
# Uma marcenaria fabrica mesas e cadeiras. Cada produto tem lucro unitario e
# consome horas de acabamento. O objetivo e escolher a quantidade de cada
# produto que maximiza o lucro total sem estourar a capacidade do setor.
#
# Pontos de sintaxe:
#   set PRODUTOS;               conjunto de nomes (membros simbolicos)
#   param lucro {PRODUTOS};     parametro indexado pelo conjunto
#   var produzir {PRODUTOS};    uma variavel para cada membro do conjunto
#   sum {p in PRODUTOS} ...     somatorio indexado

set PRODUTOS;

param lucro {PRODUTOS} >= 0;
param horas {PRODUTOS} >= 0;
param capacidade >= 0;

var produzir {PRODUTOS} >= 0;

maximize lucro_total:
    sum {p in PRODUTOS} lucro[p] * produzir[p];

subject to capacidade_acabamento:
    sum {p in PRODUTOS} horas[p] * produzir[p] <= capacidade;

data;

set PRODUTOS := mesas cadeiras;

param lucro :=
    mesas     40
    cadeiras  25;

param horas :=
    mesas     4
    cadeiras  3;

param capacidade := 120;

solve;
display produzir, lucro_total;

# Resultado obtido na execucao: 30 mesas, nenhuma cadeira, lucro 1200. A mesa
# rende mais por hora de acabamento (10 contra 8,33), logo domina a solucao.
