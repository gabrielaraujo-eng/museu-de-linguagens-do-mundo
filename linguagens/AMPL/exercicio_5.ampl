# exercicio_5.ampl: escalonamento de equipes em turnos circulares
#
# Enunciado: uma central de atendimento precisa de um numero minimo de equipes
# por dia da semana. Cada equipe trabalha dois dias consecutivos e depois
# folga; a semana e circular, de modo que a equipe que comeca no domingo
# trabalha domingo e segunda.
# Tarefa: decidir quantas equipes comecam em cada dia, minimizando o total de
# equipes contratadas.
#
# Resolucao: variaveis inteiras indexadas por um conjunto ordenado. A cobertura
# do dia d recebe as equipes que comecam em d e as que comecam no dia anterior;
# para o primeiro dia da semana, o "dia anterior" e o ultimo (last).

set DIAS ordered;

param necessidade {DIAS} >= 0;

var inicio {d in DIAS} integer >= 0;

minimize total_equipes:
    sum {d in DIAS} inicio[d];

subject to cobertura {d in DIAS}:
    inicio[d]
    + (if d = first(DIAS) then inicio[last(DIAS)] else inicio[prev(d)])
    >= necessidade[d];

data;

set DIAS := seg ter qua qui sex sab dom;

param necessidade :=
    seg 5
    ter 4
    qua 6
    qui 5
    sex 7
    sab 3
    dom 2;

solve;

display inicio, total_equipes;

# Resultado obtido na execucao: 7 equipes comecando na sexta, 5 na quarta,
# 3 na segunda, 2 no domingo e 1 na terca, total 18. A sexta cobre sexta e
# sabado; a quarta cobre quarta e quinta; o domingo cobre domingo e segunda,
# o que explica por que a segunda nao precisa de equipes proprias em numero
# maior.
