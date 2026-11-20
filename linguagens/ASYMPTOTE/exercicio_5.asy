// exercicio_5.asy -- Funcoes: grafico de f(x)=x^3-3x e raizes por bissecao.
//
// Enunciado: definir f(x) = x^3 - 3x, desenhar seu grafico no intervalo
// [-2.2, 2.2], localizar as raizes no intervalo [1, 2] pelo metodo da
// bissecao implementado em uma funcao e marcar a raiz encontrada.
//
// Compilacao: asy -f pdf exercicio_5.asy

import graph;

size(10cm, 7cm, IgnoreAspect);

real f(real x) { return x^3 - 3 * x; }

// Metodo da bissecao: devolve uma aproximacao da raiz em [a, b]
real bisseccao(real a, real b, int iteracoes) {
  real fa = f(a);
  for (int i = 0; i < iteracoes; ++i) {
    real m = (a + b) / 2;
    if (f(m) * fa > 0) { a = m; fa = f(m); }
    else               { b = m; }
  }
  return (a + b) / 2;
}

real r1 = bisseccao(1, 2, 40);      // raiz positiva: sqrt(3)
real r2 = bisseccao(-2, -1, 40);    // raiz negativa: -sqrt(3)

draw(graph(f, -2.2, 2.2), rgb(0.15, 0.30, 0.75) + linewidth(1.4));
xaxis("x", Ticks());
yaxis("y", Ticks());

dot((r1, 0), rgb(0.80, 0.15, 0.15));
dot((r2, 0), rgb(0.80, 0.15, 0.15));
label(format("raiz = %.6f", r1), (r1, 0), SE);
label(format("raiz = %.6f", r2), (r2, 0), SW);

// Tangente no ponto x = 1, para ilustrar a derivada f'(x) = 3x^2 - 3
real derivada(real x) { return 3 * x^2 - 3; }
real x0 = 1;
draw(graph(new real(real x) { return f(x0) + derivada(x0) * (x - x0); }, 0, 2.2),
     rgb(0.20, 0.60, 0.30) + dashed);

write("raiz positiva = " + string(r1));
write("raiz negativa = " + string(r2));
write("sqrt(3)       = " + string(sqrt(3)));
write("f(1)          = " + string(f(1)));
write("f'(1)         = " + string(derivada(1)));
