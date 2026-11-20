# exercicio_6.ampl: localizacao de instalacoes com custo fixo
#
# Enunciado: tres fabricas candidatas podem abastecer tres clientes. Abrir uma
# fabrica custa um valor fixo; cada fabrica tem capacidade limitada e cada
# cliente tem demanda obrigatoria. O custo de envio depende da rota.
# Tarefa: decidir quais fabricas abrir e quanto cada uma envia a cada cliente,
# minimizando custo fixo mais custo de transporte.
#
# Resolucao: mistura de variavel binaria (abrir) e continua (atender). A
# restricao de capacidade usa o produto capacidade[f] * abrir[f], o que obriga
# o fluxo a zero quando a fabrica nao e aberta. Esse acoplamento e a versao
# sem constante "grande-M": o proprio limite superior da variavel faz o papel
# da constante.

set FABRICAS;
set CLIENTES;

param custo_fixo {FABRICAS} >= 0;
param capacidade {FABRICAS} >= 0;
param custo_envio {FABRICAS, CLIENTES} >= 0;
param demanda {CLIENTES} >= 0;

var abrir {FABRICAS} binary;
var atender {FABRICAS, CLIENTES} >= 0;

minimize custo_total:
    sum {f in FABRICAS} custo_fixo[f] * abrir[f]
    + sum {f in FABRICAS, c in CLIENTES} custo_envio[f,c] * atender[f,c];

subject to demanda_cliente {c in CLIENTES}:
    sum {f in FABRICAS} atender[f,c] = demanda[c];

subject to capacidade_fabrica {f in FABRICAS}:
    sum {c in CLIENTES} atender[f,c] <= capacidade[f] * abrir[f];

data;

set FABRICAS := norte sul oeste;
set CLIENTES := c1 c2 c3;

param custo_fixo :=
    norte 100
    sul   120
    oeste  90;

param capacidade :=
    norte 60
    sul   50
    oeste 70;

param custo_envio: c1 c2 c3 :=
    norte          4  6  8
    sul            7  4  5
    oeste          6  5  3 ;

param demanda :=
    c1 40
    c2 45
    c3 35;

solve;

display abrir, atender, custo_total;

# Resultado obtido na execucao: abrir norte e oeste (custo fixo 190) e enviar
# norte -> c1 40, norte -> c2 10, oeste -> c2 35, oeste -> c3 35; custo de
# transporte 500 e custo total 690. A fabrica sul, com custo fixo maior, fica
# fechada.
