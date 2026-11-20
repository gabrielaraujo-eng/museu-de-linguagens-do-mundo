# exemplo_4.ampl: variaveis binarias: problema da mochila
#
# Tema: programacao inteira binaria.
# Um excursionista escolhe quais itens levar. Cada item tem valor de utilidade
# e peso; a mochila suporta no maximo uma certa carga.
#
# Pontos de sintaxe:
#   var levar {ITENS} binary;   variavel que so assume 0 ou 1
#   restricao unica (sem indice) tambem e valida
#
# Observacao: modelos com variaveis binarias exigem um solver de programacao
# inteira (por exemplo CBC, HiGHS ou Gurobi).

set ITENS;

param valor {ITENS} >= 0;
param peso {ITENS} >= 0;
param capacidade >= 0;

var levar {ITENS} binary;

maximize valor_total:
    sum {i in ITENS} valor[i] * levar[i];

subject to limite_de_peso:
    sum {i in ITENS} peso[i] * levar[i] <= capacidade;

data;

set ITENS := lanterna barraca agua comida mapa;

param valor :=
    lanterna  6
    barraca  10
    agua      5
    comida    8
    mapa      3;

param peso :=
    lanterna 2
    barraca  7
    agua     3
    comida   4
    mapa     1;

param capacidade := 12;

solve;
display levar, valor_total;

# Resultado obtido na execucao: levar lanterna, agua, comida e mapa (peso 10 de
# 12, valor 22); a barraca fica de fora porque seu valor por quilo e baixo.
