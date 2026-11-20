# exercicio_10.ampl: despacho economico com custo quadratico
#
# Enunciado: tres unidades geradoras atendem uma demanda total de 300 MW. Cada
# unidade tem custo linear e custo quadratico por MW gerado, alem de limites
# minimo e maximo de operacao.
# Tarefa: distribuir a geracao ao menor custo.
#
# Resolucao: problema quadratico convexo. Como o custo marginal cresce com a
# geracao, o otimo iguala os custos marginais das unidades ativas, respeitando
# os limites. E o primeiro exemplo da pasta em que a funcao objetivo nao e
# linear.

set UNIDADES;

param custo_linear {UNIDADES} >= 0;
param custo_quadratico {UNIDADES} >= 0;
param geracao_minima {UNIDADES} >= 0;
param geracao_maxima {UNIDADES} >= 0;
param demanda_total >= 0;

var geracao {u in UNIDADES} >= geracao_minima[u], <= geracao_maxima[u];

minimize custo_total:
    sum {u in UNIDADES} (custo_linear[u] * geracao[u]
                         + custo_quadratico[u] * geracao[u]^2);

subject to atender_demanda:
    sum {u in UNIDADES} geracao[u] = demanda_total;

data;

set UNIDADES := hidro carvao gas;

param custo_linear :=
    hidro   5
    carvao 12
    gas    18;

param custo_quadratico :=
    hidro  0.02
    carvao 0.01
    gas    0.03;

param geracao_minima :=
    hidro  20
    carvao 30
    gas    10;

param geracao_maxima :=
    hidro 150
    carvao 120
    gas   100;

param demanda_total := 300;

solve;

display geracao, custo_total;

printf "\nCusto marginal da hidro: %.2f\n",
    custo_linear["hidro"] + 2 * custo_quadratico["hidro"] * geracao["hidro"];

# Resultado obtido na execucao: hidro 150 (limite superior), carvao 120
# (limite superior) e gas 30; custo total 3351 e custo marginal da hidro 11,00.
# As duas unidades mais baratas saturam e a mais cara fecha o balanco.
