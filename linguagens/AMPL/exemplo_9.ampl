# exemplo_9.ampl: validacao de dados com a instrucao check
#
# Tema: compras com varios fornecedores e verificacao de consistencia.
# Tres fornecedores tem capacidade e preco diferentes. A demanda precisa ser
# atendida ao menor custo, e cada fornecedor tem um pedido minimo.
#
# Pontos de sintaxe:
#   check: condicao;   declaracao de consistencia dos dados. A condicao e
#                      avaliada quando o modelo e preparado para resolver
#                      (comando solve) ou pelo comando check. Se for falsa, a
#                      AMPL aborta com "check at line N fails", antes de
#                      chamar o solver. Comportamento verificado na execucao.
#   var comprar {f in ...} >= minimo[f], <= capacidade[f];   limites indexados

set FORNECEDORES;

param capacidade {FORNECEDORES} >= 0;
param minimo {FORNECEDORES} >= 0;
param preco {FORNECEDORES} >= 0;
param demanda >= 0;

var comprar {f in FORNECEDORES} >= minimo[f], <= capacidade[f];

# Consistencia: a capacidade total tem de cobrir a demanda.
check: sum {f in FORNECEDORES} capacidade[f] >= demanda;

minimize custo_total:
    sum {f in FORNECEDORES} preco[f] * comprar[f];

subject to atender_demanda:
    sum {f in FORNECEDORES} comprar[f] >= demanda;

data;

set FORNECEDORES := alfa beta gama;

param capacidade :=
    alfa 500
    beta 300
    gama 400;

param minimo :=
    alfa 100
    beta   0
    gama  50;

param preco :=
    alfa 8
    beta 11
    gama  9;

param demanda := 700;

solve;
display comprar, custo_total;

# Resultado obtido na execucao: alfa 500, beta 0, gama 200, custo 5800. O
# pedido minimo de 100 unidades em alfa e respeitado e gama cobre o restante
# por ter preco menor que beta.
