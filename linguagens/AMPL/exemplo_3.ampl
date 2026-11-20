# exemplo_3.ampl: variaveis indexadas por dois conjuntos: transporte
#
# Tema: modelo de transporte (dois indices).
# Duas fabricas abastecem tres centros de distribuicao. Cada rota tem custo
# unitario proprio. Queremos o plano de envio de custo minimo.
#
# Pontos de sintaxe:
#   var envio {ORIGENS, DESTINOS};     variavel bidimensional
#   subject to restricao {i in ...}:   uma restricao por membro do conjunto
#   param custo {ORIGENS, DESTINOS};   tabela de dados com dois indices

set ORIGENS;
set DESTINOS;

param oferta {ORIGENS} >= 0;
param demanda {DESTINOS} >= 0;
param custo {ORIGENS, DESTINOS} >= 0;

var envio {ORIGENS, DESTINOS} >= 0;

minimize custo_total:
    sum {o in ORIGENS, d in DESTINOS} custo[o,d] * envio[o,d];

# Nao se pode enviar mais do que a fabrica produz.
subject to limite_de_oferta {o in ORIGENS}:
    sum {d in DESTINOS} envio[o,d] <= oferta[o];

# Cada centro precisa receber pelo menos a sua demanda.
subject to atender_demanda {d in DESTINOS}:
    sum {o in ORIGENS} envio[o,d] >= demanda[d];

data;

set ORIGENS  := FAB1 FAB2;
set DESTINOS := NORTE SUL LESTE;

param oferta :=
    FAB1 100
    FAB2  80;

param demanda :=
    NORTE 60
    SUL   70
    LESTE 40;

# Tabela de duas dimensoes: linhas = origens, colunas = destinos.
param custo: NORTE SUL LESTE :=
    FAB1      4     6     9
    FAB2      5     7     8 ;

solve;
display envio, custo_total;

# Resultado obtido na execucao: custo minimo 1010, com FAB1 enviando 30 para
# NORTE e 70 para SUL, e FAB2 enviando 30 para NORTE e 40 para LESTE.
