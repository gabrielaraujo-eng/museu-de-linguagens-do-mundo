// exemplo_4.asy -- Lacos de repeticao: for e while.
//
// Compilacao: asy -f pdf exemplo_4.asy

unitsize(1cm);

int  n = 7;                       // numero de vertices
real R = 2.5;                     // raio da circunferencia circunscrita

// ---- for: monta um poligono regular vertice a vertice -------------
path poligono;
for (int i = 0; i < n; ++i) {
  real angulo = 360.0 * i / n;    // em graus
  pair v = R * dir(angulo);       // dir() devolve vetor unitario
  if (i == 0) poligono = v;
  else        poligono = poligono -- v;
  dot(v, rgb(0.1, 0.1, 0.4));
}
poligono = poligono -- cycle;

draw(poligono, rgb(0.10, 0.30, 0.70) + linewidth(1.3));

// ---- while: mesma construcao, agora com acumulador -----------------
int    k = 1;
real   soma = 0;
while (k <= 10) {
  soma = soma + k;                // 1+2+...+10
  k = k + 1;
}
write("soma de 1 a 10 = " + string(soma));

// ---- for decrescente: raios do poligono ---------------------------
for (int i = n - 1; i >= 0; --i) {
  draw((0, 0) -- R * dir(360.0 * i / n), rgb(0.75, 0.75, 0.75) + dashed);
}

draw(scale(R) * unitcircle, rgb(0.60, 0.60, 0.60) + dashed);
label(format("poligono regular de %d lados", n), (0, -R - 0.6), S);
