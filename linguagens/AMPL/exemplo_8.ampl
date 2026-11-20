# exemplo_8.ampl: expressoes e valor absoluto linearizado
#
# Tema: desvio em relacao a uma meta.
# Cada loja tem um resultado realizado e todas deveriam ficar perto da meta
# comum. Queremos escolher a meta que minimiza a soma dos desvios absolutos.
#
# Ponto importante: |x| nao e linear. A forma padrao em programacao linear e
# introduzir uma variavel de desvio d >= 0 com duas restricoes:
#     d >= x - meta   e   d >= meta - x
# Na solucao otima, d assume exatamente |x - meta|.
#
# Pontos de sintaxe:
#   param realizado {LOJAS};   parametro que pode assumir valor negativo
#   var meta;                  variavel livre (sem limite), declarada sem >= 0
#   min(x, y), max(x, y), abs(x)  funcoes internas, uteis em expressoes

set LOJAS;

param realizado {LOJAS};

var meta;
var desvio {LOJAS} >= 0;

minimize desvio_total:
    sum {l in LOJAS} desvio[l];

subject to desvio_acima {l in LOJAS}:
    desvio[l] >= realizado[l] - meta;

subject to desvio_abaixo {l in LOJAS}:
    desvio[l] >= meta - realizado[l];

data;

set LOJAS := centro bairro shopping;

param realizado :=
    centro   18
    bairro   -4
    shopping 27;

solve;

display meta, desvio, desvio_total;

# A mediana dos resultados minimiza a soma dos desvios absolutos.
printf "\nMeta otima (mediana dos resultados): %.2f\n", meta;
printf "Menor resultado: %g | maior resultado: %g\n",
    min {l in LOJAS} realizado[l], max {l in LOJAS} realizado[l];
