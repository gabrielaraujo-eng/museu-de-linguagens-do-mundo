# exemplo_1.ampl: estrutura minima de um modelo de programacao linear
#
# Tema: o esqueleto de um modelo AMPL.
# Uma oficina produz um unico item. Cada unidade da lucro e consome horas de
# maquina. O modelo decide quanto produzir para maximizar o lucro, respeitando
# as horas disponiveis.
#
# Estrutura minima de um modelo:
#   param  -> dados numericos conhecidos
#   var    -> variavel de decisao
#   maximize/minimize -> funcao objetivo
#   subject to        -> restricoes
#   data              -> valores dos parametros
#   solve / display   -> comandos de script executados depois da leitura

param lucro_por_unidade >= 0;
param horas_por_unidade >= 0;
param horas_disponiveis >= 0;

var producao >= 0;

maximize lucro_total:
    lucro_por_unidade * producao;

subject to capacidade_de_horas:
    horas_por_unidade * producao <= horas_disponiveis;

data;

param lucro_por_unidade := 12;
param horas_por_unidade := 3;
param horas_disponiveis := 40;

# Comandos de script: resolvem o modelo e mostram a solucao.
solve;
display producao, lucro_total;

# Resultado obtido na execucao: producao 13,333 e lucro total 160. A capacidade
# e o unico limite, entao o modelo usa todas as 40 horas de maquina.
