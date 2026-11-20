# exercicio_4.ampl: selecao de projetos com dependencia
#
# Enunciado: quatro projetos estao na carteira. Cada um tem custo e retorno
# estimados. O orcamento e de R$ 100 mil e no maximo tres projetos podem ser
# aprovados. Alem disso, o projeto "expansao" so pode ser aprovado se
# "modernizacao" tambem for aprovado.
# Tarefa: escolher o subconjunto de retorno total maximo.
#
# Resolucao: mochila binaria com uma restricao logica adicional. A dependencia
# se escreve como escolher[expansao] <= escolher[modernizacao]: se expansao
# vale 1, modernizacao tambem precisa valer 1.

set PROJETOS;

param custo {PROJETOS} >= 0;
param retorno {PROJETOS} >= 0;
param orcamento >= 0;
param maximo_projetos >= 0;

var escolher {PROJETOS} binary;

maximize retorno_total:
    sum {p in PROJETOS} retorno[p] * escolher[p];

subject to limite_orcamento:
    sum {p in PROJETOS} custo[p] * escolher[p] <= orcamento;

subject to limite_quantidade:
    sum {p in PROJETOS} escolher[p] <= maximo_projetos;

subject to dependencia:
    escolher["expansao"] <= escolher["modernizacao"];

data;

set PROJETOS := modernizacao expansao treinamento marketing;

param custo :=
    modernizacao 40
    expansao     35
    treinamento  20
    marketing    30;

param retorno :=
    modernizacao 55
    expansao     48
    treinamento  26
    marketing    38;

param orcamento       := 100;
param maximo_projetos :=   3;

solve;

display escolher, retorno_total;

# Resultado obtido na execucao: modernizacao, expansao e treinamento (custo 95,
# retorno 129). Marketing fica de fora porque nao cabe no orcamento junto com
# os tres projetos de maior retorno, e o limite de tres projetos tambem atua.
