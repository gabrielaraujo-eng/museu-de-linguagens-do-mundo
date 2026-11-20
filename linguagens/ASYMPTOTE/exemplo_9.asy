// exemplo_9.asy -- Matematica: pi, trigonometria, exponencial e logaritmo.
//
// Compilacao: asy -f pdf exemplo_9.asy

import graph;

size(11cm, 7cm, IgnoreAspect);

real pi2 = 2 * pi;                 // pi e constante da biblioteca padrao

// ---- valores numericos -------------------------------------------
write("pi = " + string(pi));
write("sin(pi/6) = " + string(sin(pi / 6)));
write("cos(pi/3) = " + string(cos(pi / 3)));
write("exp(1) = " + string(exp(1)));
write("log(exp(2)) = " + string(log(exp(2))));
write("sqrt(2) = " + string(sqrt(2)));

// ---- funcoes para o grafico --------------------------------------
real seno(real x) { return sin(x); }
real amortecido(real x) { return exp(-0.4 * x) * sin(3 * x); }

draw(graph(seno, 0, pi2), rgb(0.10, 0.30, 0.80) + linewidth(1.2));
draw(graph(amortecido, 0, pi2), rgb(0.80, 0.20, 0.20) + linewidth(1.0));

// marcas em multiplos de pi/2
for (int k = 0; k <= 4; ++k) {
  real x = k * pi / 2;
  dot((x, sin(x)), black);
  draw((x, 0) -- (x, sin(x)), gray + dashed);
}

xaxis("x", Ticks(NoZero, Step=pi/2));
yaxis("y", Ticks(Step=0.5));

label("sin(x)", (1.2, 1.15), N);
label("exp(-0.4x) sin(3x)", (4.4, 0.9), N);
