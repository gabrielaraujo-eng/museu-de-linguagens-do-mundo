// exercicio_10.asy -- Algoritmo: ordenacao por selecao e caminho poligonal.
//
// Enunciado: dado um conjunto de pontos, ordena-los pela distancia a origem
// com o algoritmo de ordenacao por selecao (sem usar sort) e desenhar a
// poligonal que os visita nessa ordem, numerando o percurso.
//
// Compilacao: asy -f pdf exercicio_10.asy

// Converte um par ordenado em texto (string(pair) nao existe na biblioteca)
string texto(pair p) { return "(" + string(p.x) + ", " + string(p.y) + ")"; }

unitsize(1cm);

pair[] pts = {(4, 1), (-2, 3), (1, 1), (-3, -1), (2, -2.5), (5, 3)};

real dist(pair p) { return length(p); }

// ---- ordenacao por selecao ---------------------------------------
for (int i = 0; i < pts.length - 1; ++i) {
  int menor = i;
  for (int j = i + 1; j < pts.length; ++j) {
    if (dist(pts[j]) < dist(pts[menor])) menor = j;
  }
  if (menor != i) {
    pair tmp = pts[i];
    pts[i] = pts[menor];
    pts[menor] = tmp;
  }
}

// ---- desenho -----------------------------------------------------
for (int i = 0; i < pts.length - 1; ++i) {
  draw(pts[i] -- pts[i + 1], rgb(0.60, 0.60, 0.60) + linewidth(0.9));
}

for (int i = 0; i < pts.length; ++i) {
  dot(pts[i], rgb(0.15, 0.30, 0.70));
  label(format("%d", i + 1), pts[i], 1.4 * pts[i]);
  write(string(i + 1) + ": " + texto(pts[i]) + "  d = " + string(dist(pts[i])));
}

draw(scale(0.15) * unitcircle, rgb(0.75, 0.15, 0.15) + dashed);
label("origem", (0, 0), SW);
label("percurso ordenado por distancia", (0, -4), S);
