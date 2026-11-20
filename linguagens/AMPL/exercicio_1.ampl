# exercicio_1.ampl: mix de producao com dois recursos escassos
#
# Enunciado: uma fabrica produz os modelos A e B. O modelo A da lucro de R$ 50
# e consome 2 horas de maquina e 1 hora de operador; o modelo B da lucro de
# R$ 40 e consome 1 hora de maquina e 2 horas de operador. Ha 100 horas de
# maquina e 80 horas de operador disponiveis no mes.
# Tarefa: decidir as quantidades de A e B que maximizam o lucro.
#
# Resolucao: modelo linear classico de dois produtos e dois recursos.
# O otimo ocorre na intersecao das duas restricoes ativas.

set PRODUTOS;

param lucro {PRODUTOS} >= 0;
param horas_maquina {PRODUTOS} >= 0;
param horas_operador {PRODUTOS} >= 0;
param maquina_disponivel >= 0;
param operador_disponivel >= 0;

var quantidade {PRODUTOS} >= 0;

maximize lucro_total:
    sum {p in PRODUTOS} lucro[p] * quantidade[p];

subject to limite_maquina:
    sum {p in PRODUTOS} horas_maquina[p] * quantidade[p] <= maquina_disponivel;

subject to limite_operador:
    sum {p in PRODUTOS} horas_operador[p] * quantidade[p] <= operador_disponivel;

data;

set PRODUTOS := A B;

param lucro :=
    A 50
    B 40;

param horas_maquina :=
    A 2
    B 1;

param horas_operador :=
    A 1
    B 2;

param maquina_disponivel  := 100;
param operador_disponivel :=  80;

solve;

display quantidade, lucro_total;

# Resultado obtido na execucao: A = 40, B = 20, lucro = 2800.
