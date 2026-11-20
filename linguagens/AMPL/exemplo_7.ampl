# exemplo_7.ampl: parametros simbolicos e saida formatada
#
# Tema: dados textuais e relatorio com printf.
# Duas filiais tem metas de venda diferentes e o preco e o mesmo. O modelo
# maximiza a receita respeitando a meta de cada filial e imprime um relatorio
# alinhado com o comando printf.
#
# Pontos de sintaxe:
#   param cidade {FILIAIS} symbolic;   parametro cujo valor e um texto
#   printf "%-8s %10.2f\n", ...        formatacao no estilo da linguagem C
#   for {f in FILIAIS} { ... }         laco de script sobre um conjunto
#
# Aspas: textos com espacos precisam de aspas ("Porto Alegre").

set FILIAIS;

param cidade {FILIAIS} symbolic;
param meta {FILIAIS} >= 0;
param preco >= 0;

var vendas {f in FILIAIS} >= 0, <= meta[f];

maximize receita:
    preco * sum {f in FILIAIS} vendas[f];

data;

set FILIAIS := sul norte;

param cidade :=
    sul   "Porto Alegre"
    norte "Recife";

param meta :=
    sul   120
    norte  90;

param preco := 35;

solve;

printf "\nRelatorio de vendas\n";
printf "%-8s %-14s %8s %10s\n", "Filial", "Cidade", "Meta", "Vendas";
for {f in FILIAIS} {
    printf "%-8s %-14s %8g %10.2f\n", f, cidade[f], meta[f], vendas[f];
}
printf "\nReceita total: %.2f\n", receita;
