# exemplo_6.ampl: conjunto ordenado e funcao prev: estoque multiperiodo
#
# Tema: planejamento da producao em varios periodos.
# Uma fabrica produz um item ao longo de quatro meses. Produzir em um mes custa
# um valor por unidade; estocar custa por unidade e por mes. O estoque de um mes
# depende do estoque do mes anterior.
#
# Pontos de sintaxe:
#   set PERIODOS ordered;     a ordem dos membros e significativa
#   first(PERIODOS)           primeiro membro na ordem declarada
#   prev(t)                   membro imediatamente anterior a t
#   if ... then ... else ...  expressao condicional dentro de uma restricao

set PERIODOS ordered;

param demanda {PERIODOS} >= 0;
param custo_producao {PERIODOS} >= 0;
param capacidade {PERIODOS} >= 0;
param custo_estoque >= 0;
param estoque_inicial >= 0;

var produzir {t in PERIODOS} >= 0, <= capacidade[t];
var estoque {t in PERIODOS} >= 0;

minimize custo_total:
    sum {t in PERIODOS} (custo_producao[t] * produzir[t] + custo_estoque * estoque[t]);

# Balanco de material: estoque final = estoque inicial + producao - demanda.
subject to balanco {t in PERIODOS}:
    estoque[t] =
        (if t = first(PERIODOS) then estoque_inicial else estoque[prev(t)])
        + produzir[t] - demanda[t];

data;

set PERIODOS := jan fev mar abr;

param demanda :=
    jan 40
    fev 60
    mar 50
    abr 70;

param custo_producao :=
    jan 10
    fev 12
    mar 11
    abr 14;

param capacidade :=
    jan 80
    fev 80
    mar 80
    abr 80;

param custo_estoque   := 2;
param estoque_inicial := 10;

solve;
display produzir, estoque, custo_total;

# Resultado obtido na execucao: custo 2520. A producao antecipa nos meses de
# custo menor (janeiro e marco) e usa o estoque nos meses caros.
