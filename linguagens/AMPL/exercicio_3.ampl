# exercicio_3.ampl: designacao de tarefas
#
# Enunciado: tres analistas devem executar tres tarefas, um para cada tarefa.
# A tabela abaixo da o custo (em horas) de cada analista em cada tarefa.
# Tarefa: encontrar a designacao de custo total minimo.
#
# Resolucao: modelo de designacao. As variaveis sao binarias e as restricoes
# garantem exatamente uma tarefa por analista e exatamente um analista por
# tarefa. E um caso particular do problema de transporte com oferta e demanda
# iguais a 1.

set ANALISTAS;
set TAREFAS;

param custo {ANALISTAS, TAREFAS} >= 0;

var designar {ANALISTAS, TAREFAS} binary;

minimize custo_total:
    sum {a in ANALISTAS, t in TAREFAS} custo[a,t] * designar[a,t];

subject to uma_tarefa_por_analista {a in ANALISTAS}:
    sum {t in TAREFAS} designar[a,t] = 1;

subject to um_analista_por_tarefa {t in TAREFAS}:
    sum {a in ANALISTAS} designar[a,t] = 1;

data;

set ANALISTAS := ana bruno carla;
set TAREFAS   := auditoria proposta suporte;

param custo: auditoria proposta suporte :=
    ana            8        4       6
    bruno          6        5       7
    carla          5        9       4 ;

solve;

display designar, custo_total;

# Resultado obtido na execucao: ana -> proposta (4), bruno -> auditoria (6),
# carla -> suporte (4), custo total 14. A designacao "obvia" ana -> auditoria
# seria pior no total.
