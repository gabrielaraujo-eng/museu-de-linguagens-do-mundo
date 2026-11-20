# exemplo_5.ampl: variaveis inteiras gerais
#
# Tema: producao em lotes inteiros.
# Uma fabrica produz tintas em lotes fechados. Cada lote rende uma quantidade
# fixa de unidades e tem um custo. A demanda de cada produto precisa ser
# atendida; o numero de lotes e inteiro.
#
# Pontos de sintaxe:
#   var lotes {PRODUTOS} integer >= 0;   variavel inteira nao negativa
#   o limite superior efetivo vem das restricoes de demanda
#
# A solucao otima de cada produto e o menor inteiro que cobre a demanda, ou
# seja, o teto da divisao demanda / rendimento.

set PRODUTOS;

param demanda {PRODUTOS} >= 0;
param rendimento {PRODUTOS} > 0;
param custo_lote {PRODUTOS} >= 0;

var lotes {PRODUTOS} integer >= 0;

minimize custo_total:
    sum {p in PRODUTOS} custo_lote[p] * lotes[p];

subject to atender_demanda {p in PRODUTOS}:
    rendimento[p] * lotes[p] >= demanda[p];

data;

set PRODUTOS := tinta verniz;

param demanda :=
    tinta  250
    verniz  90;

param rendimento :=
    tinta  60
    verniz 25;

param custo_lote :=
    tinta  150
    verniz  80;

solve;
display lotes, custo_total;

# Resultado obtido na execucao: 5 lotes de tinta e 4 de verniz, custo 1070.
# Note que 4 lotes de verniz produzem 100 unidades para uma demanda de 90: o
# excedente e inevitavel porque lotes sao indivisiveis.
