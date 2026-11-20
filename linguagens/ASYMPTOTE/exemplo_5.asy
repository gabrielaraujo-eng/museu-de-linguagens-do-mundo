// exemplo_5.asy -- Funcoes definidas pelo usuario e graficos de funcoes.
//
// Compilacao: asy -f pdf exemplo_5.asy

import graph;                    // xaxis, yaxis, graph, Ticks

size(10cm, 7cm, IgnoreAspect);

// ---- funcoes reais de uma variavel real ---------------------------
real f(real x) { return x^2 - 2; }        // ^ e potenciacao
real g(real x) { return 2 * x + 1; }

// Funcao com dois parametros e valor padrao
real deslocada(real x, real dx = 1) { return f(x - dx); }

// ---- desenho ------------------------------------------------------
draw(graph(f, -2.6, 2.6), rgb(0.80, 0.10, 0.10) + linewidth(1.3));
draw(graph(g, -2.6, 2.6), rgb(0.10, 0.30, 0.75) + linewidth(1.3));
draw(graph(new real(real x) { return deslocada(x, 1); }, -2.6, 2.6),
     rgb(0.10, 0.55, 0.20) + dashed);

xaxis("x", Ticks());
yaxis("y", Ticks());

label("f(x) = x*x - 2", (1.8, 1.0), E);
label("g(x) = 2x + 1", (-2.4, -1.6), E);
label("f(x-1)", (-1.6, 3.4), E);

// ---- uso das funcoes fora do desenho ------------------------------
write("f(3) = " + string(f(3)));
write("g(0) = " + string(g(0)));
write("deslocada(1) = " + string(deslocada(1)));
