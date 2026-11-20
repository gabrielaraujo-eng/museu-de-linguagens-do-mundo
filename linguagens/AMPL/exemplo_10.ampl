# exemplo_10.ampl: modelo nao linear: ajuste por minimos quadrados
#
# Tema: estimar os coeficientes de uma reta y = a*x + b que melhor se ajusta a
# cinco pontos observados, minimizando a soma dos erros ao quadrado.
#
# Pontos de sintaxe:
#   var a;    variavel livre, sem sinal fixado
#   ^2        potencia; torna o objetivo quadratico (nao linear)
#   solve     exige um solver que aceite objetivos nao lineares
#             (por exemplo MINOS, Ipopt ou o modulo de QP do HiGHS)
#
# Diferenca em relacao aos exemplos anteriores: aqui as variaveis de decisao
# sao coeficientes de um modelo estatistico, nao quantidades produzidas.

set PONTOS;

param x_obs {PONTOS};
param y_obs {PONTOS};

var a;
var b;

minimize erro_quadratico:
    sum {p in PONTOS} (y_obs[p] - (a * x_obs[p] + b))^2;

data;

set PONTOS := 1 2 3 4 5;

param x_obs :=
    1 1
    2 2
    3 3
    4 5
    5 7;

param y_obs :=
    1 2.1
    2 3.9
    3 6.2
    4 7.8
    5 10.1;

solve;

display a, b, erro_quadratico;
printf "\nReta ajustada: y = %.4f * x + %.4f\n", a, b;
