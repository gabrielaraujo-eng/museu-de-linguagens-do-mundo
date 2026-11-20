// exercicio_6.asy -- Estruturas de dados: struct Ponto, caixa envolvente e centroide.
//
// Enunciado: definir a struct Ponto (coordenadas e distancia a origem),
// guardar seis pontos em um array, desenhar a nuvem de pontos, a caixa
// envolvente (menor retangulo alinhado aos eixos) e o centroide.
//
// Compilacao: asy -f pdf exercicio_6.asy

// Converte um par ordenado em texto (string(pair) nao existe na biblioteca)
string texto(pair p) { return "(" + string(p.x) + ", " + string(p.y) + ")"; }

unitsize(1cm);

struct Ponto {
  real x, y;

  void operator init(real x, real y) { this.x = x; this.y = y; }

  pair pos() { return (x, y); }

  real norma() { return sqrt(x^2 + y^2); }
}

Ponto[] nuvem = {Ponto(1, 2), Ponto(3.5, 1), Ponto(2, 4.5),
                 Ponto(5, 3), Ponto(4, 5.5), Ponto(6.5, 2.5)};

// ---- caixa envolvente e centroide --------------------------------
real xmin = nuvem[0].x, xmax = nuvem[0].x;
real ymin = nuvem[0].y, ymax = nuvem[0].y;
real sx = 0, sy = 0;

for (int i = 0; i < nuvem.length; ++i) {
  Ponto p = nuvem[i];
  xmin = min(xmin, p.x); xmax = max(xmax, p.x);
  ymin = min(ymin, p.y); ymax = max(ymax, p.y);
  sx = sx + p.x; sy = sy + p.y;
}

pair centro = (sx / nuvem.length, sy / nuvem.length);

draw(box((xmin, ymin), (xmax, ymax)), rgb(0.60, 0.60, 0.60) + dashed);

for (int i = 0; i < nuvem.length; ++i) {
  dot(nuvem[i].pos(), rgb(0.10, 0.25, 0.65));
  label(format("%.2f", nuvem[i].norma()), nuvem[i].pos(), NE);
}

// centroide em destaque
fill(circle(centro, 0.12), rgb(0.85, 0.15, 0.15));
label("centroide", centro, S);

write("x em [" + string(xmin) + ", " + string(xmax) + "]");
write("y em [" + string(ymin) + ", " + string(ymax) + "]");
write("centroide = " + texto(centro));
write("ponto mais distante da origem = " + string(nuvem[4].norma()));
