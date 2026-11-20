# exercicio_9.ampl: mistura com verificacao de consistencia
#
# Enunciado: uma industria monta um lote de 500 kg de racao misturando tres
# insumos. Cada insumo tem custo por kg, teor de proteina (em %) e quantidade
# disponivel. O lote precisa ter teor medio de proteina de pelo menos 65%.
# Tarefa: achar a mistura de custo minimo e garantir, por check, que ha
# insumo suficiente para o lote.
#
# Resolucao: modelo de mistura com uma restricao de qualidade que acopla teor e
# volume. A instrucao check e avaliada no momento de resolver: se a
# disponibilidade total fosse menor que o lote, a AMPL abortaria com
# "check at line N fails", antes de o solver rodar, sem mensagem enganosa de
# "inviavel" vinda do solver.

set INSUMOS;

param custo {INSUMOS} >= 0;
param proteina {INSUMOS} >= 0;
param disponibilidade {INSUMOS} >= 0;
param lote >= 0;
param proteina_minima >= 0;

var usar {i in INSUMOS} >= 0, <= disponibilidade[i];

check: sum {i in INSUMOS} disponibilidade[i] >= lote;

minimize custo_total:
    sum {i in INSUMOS} custo[i] * usar[i];

subject to volume:
    sum {i in INSUMOS} usar[i] = lote;

subject to qualidade:
    sum {i in INSUMOS} proteina[i] * usar[i] >= proteina_minima * lote;

data;

set INSUMOS := A B C;

param custo :=
    A 4
    B 7
    C 3;

param proteina :=
    A 80
    B 95
    C 55;

param disponibilidade :=
    A 300
    B 200
    C 400;

param lote            := 500;
param proteina_minima :=  65;

solve;

display usar, custo_total;

printf "\nTeor medio de proteina: %.2f%%\n",
    sum {i in INSUMOS} proteina[i] * usar[i] / lote;

# O insumo B, mais proteico, e caro demais: A e C ja atendem ao minimo.

# Resultado obtido na execucao: A = 200, B = 0, C = 300, custo 1700, teor medio
# de proteina 65,00%. O insumo B, mais proteico, e caro demais: A e C ja
# atendem ao minimo.
