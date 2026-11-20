# exercicio_8.ampl: relatorio formatado com parametros simbolicos
#
# Enunciado: uma loja tem quatro produtos, cada um de uma categoria, com lucro
# unitario, espaco ocupado na prateleira e demanda maxima. A prateleira tem
# 6 metros lineares.
# Tarefa: decidir a quantidade exposta de cada produto para maximizar o lucro e
# imprimir um relatorio por categoria.
#
# Resolucao: modelo linear simples (nao ha custo fixo nem inteireza) mais um
# bloco de script com printf. A saida e o segundo objetivo pedagogico: AMPL
# aceita formatos no estilo da linguagem C e percorre conjuntos com for.

set PRODUTOS;
set CATEGORIAS;

param categoria {PRODUTOS} symbolic;
param lucro {PRODUTOS} >= 0;
param espaco {PRODUTOS} >= 0;
param demanda_maxima {PRODUTOS} >= 0;
param espaco_total >= 0;

var expor {p in PRODUTOS} >= 0, <= demanda_maxima[p];

maximize lucro_total:
    sum {p in PRODUTOS} lucro[p] * expor[p];

subject to prateleira:
    sum {p in PRODUTOS} espaco[p] * expor[p] <= espaco_total;

data;

set PRODUTOS   := cafe cha biscoito suco;
set CATEGORIAS := bebida alimento;

param categoria :=
    cafe      "bebida"
    cha       "bebida"
    biscoito  "alimento"
    suco      "bebida";

param lucro :=
    cafe      6
    cha       4
    biscoito  5
    suco      7;

param espaco :=
    cafe      0.20
    cha       0.15
    biscoito  0.30
    suco      0.25;

param demanda_maxima :=
    cafe      40
    cha       50
    biscoito  30
    suco      35;

param espaco_total := 6;

solve;

printf "\n%-10s %-10s %10s %10s\n", "Produto", "Categoria", "Expor", "Lucro";
printf "%-10s %-10s %10s %10s\n", "-------", "---------", "-----", "-----";

for {c in CATEGORIAS} {
    printf "-- %s --\n", c;
    for {p in PRODUTOS: categoria[p] = c} {
        printf "%-10s %-10s %10.2f %10.2f\n", p, categoria[p], expor[p],
            lucro[p] * expor[p];
    }
}

printf "\nEspaco usado: %.2f de %.2f metros\n",
    sum {p in PRODUTOS} espaco[p] * expor[p], espaco_total;
printf "Lucro total: %.2f\n", lucro_total;
