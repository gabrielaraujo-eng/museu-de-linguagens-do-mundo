# exercicio_2.ampl: dieta de custo minimo
#
# Enunciado: uma cozinha industrial precisa montar uma refeicao com pelo menos
# 30 g de proteina e 40 g de calcio por pessoa, usando arroz, feijao e leite.
# Cada 100 g do alimento custa um valor e fornece quantidades conhecidas de
# cada nutriente.
# Tarefa: escolher as porcas que atendem as exigencias ao menor custo.
#
# Resolucao: modelo de mistura (blending) com restricoes do tipo >=.
# As restricoes nutricionais empurram a solucao para o alimento com melhor
# relacao custo/nutriente.

set ALIMENTOS;
set NUTRIENTES;

param custo {ALIMENTOS} >= 0;
param composicao {NUTRIENTES, ALIMENTOS} >= 0;
param exigencia {NUTRIENTES} >= 0;

var porcao {ALIMENTOS} >= 0;

minimize custo_total:
    sum {a in ALIMENTOS} custo[a] * porcao[a];

subject to nutrientes {n in NUTRIENTES}:
    sum {a in ALIMENTOS} composicao[n,a] * porcao[a] >= exigencia[n];

data;

set ALIMENTOS  := arroz feijao leite;
set NUTRIENTES := proteina calcio;

param custo :=
    arroz  2
    feijao 5
    leite  4;

param composicao: arroz feijao leite :=
    proteina         4     10     3
    calcio           1      8    12 ;

param exigencia :=
    proteina 30
    calcio   40;

solve;

display porcao, custo_total;

# Resultado obtido na execucao: feijao 2,5 e leite 1,667 porcoes, arroz zero,
# custo total 19,17. O feijao e o alimento mais eficiente em proteina por real
# (10 g por 5) e o leite cobre o calcio que falta; o arroz, apesar de barato,
# fornece pouco de cada nutriente.
