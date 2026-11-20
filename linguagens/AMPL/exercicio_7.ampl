# exercicio_7.ampl: contratacao e demissao ao longo do tempo
#
# Enunciado: uma empresa tem 20 funcionarios em janeiro e precisa de mao de
# obra crescente nos quatro primeiros meses do ano. Contratar custa 500 por
# pessoa, demitir custa 800, e cada funcionario custa 1000 por mes de salario.
# Tarefa: decidir contratacoes e demissoes mes a mes ao menor custo, sem nunca
# ficar abaixo da necessidade.
#
# Resolucao: variaveis inteiras com balanco encadeado. O efetivo de um mes e o
# efetivo do mes anterior mais contratacoes menos demissoes; o mes inicial usa
# o parametro efetivo_inicial. O conjunto e ordered para permitir prev().
#
# Observacao: como todos os dados sao inteiros, a solucao otima tambem e
# inteira, e um solver linear comum ja devolve valores inteiros.

set MESES ordered;

param necessidade {MESES} >= 0;
param efetivo_inicial >= 0;
param custo_salario >= 0;
param custo_contratar >= 0;
param custo_demitir >= 0;

var contratar {MESES} integer >= 0;
var demitir {MESES} integer >= 0;
var efetivo {MESES} integer >= 0;

minimize custo_total:
    sum {m in MESES} (custo_salario * efetivo[m]
                      + custo_contratar * contratar[m]
                      + custo_demitir * demitir[m]);

subject to balanco {m in MESES}:
    efetivo[m] =
        (if m = first(MESES) then efetivo_inicial else efetivo[prev(m)])
        + contratar[m] - demitir[m];

subject to atender_necessidade {m in MESES}:
    efetivo[m] >= necessidade[m];

data;

set MESES := jan fev mar abr;

param necessidade :=
    jan 20
    fev 28
    mar 35
    abr 30;

param efetivo_inicial := 20;
param custo_salario    := 1000;
param custo_contratar  :=  500;
param custo_demitir    :=  800;

solve;

display contratar, demitir, efetivo, custo_total;

# Resultado obtido na execucao: 8 contratacoes em fevereiro, 7 em marco e 5
# demissoes em abril; efetivo 20, 28, 35, 30; custo total 124500
# (113000 de salarios + 7500 de contratacoes + 4000 de demissoes).
