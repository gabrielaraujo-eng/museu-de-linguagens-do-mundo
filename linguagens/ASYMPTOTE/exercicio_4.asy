// exercicio_4.asy -- Lacos: poligono regular e area por decomposicao.
//
// Enunciado: com um laco for, desenhar um hexagono regular de raio 2,
// ligar o centro a cada vertice (decomposicao em triangulos) e calcular
// a area aproximada somando as areas dos seis triangulos.
//
// Compilacao: asy -f pdf exercicio_4.asy

unitsize(1cm);

int  n = 6;
real R = 2;

path hexagono;
real areaTotal = 0;

for (int i = 0; i < n; ++i) {
  real a1 = 360.0 * i / n;
  real a2 = 360.0 * (i + 1) / n;
  pair p1 = R * dir(a1);
  pair p2 = R * dir(a2);

  if (i == 0) hexagono = p1;
  hexagono = hexagono -- p2;

  // Area do triangulo O-p1-p2 pela formula do determinante
  real areaTri = abs(p1.x * p2.y - p2.x * p1.y) / 2;
  areaTotal = areaTotal + areaTri;

  draw((0, 0) -- p1, rgb(0.70, 0.70, 0.70));
  fill((0, 0) -- p1 -- p2 -- cycle,
       (i % 2 == 0) ? rgb(0.80, 0.88, 1.00) : rgb(0.92, 0.95, 1.00));
  dot(p1, rgb(0.10, 0.20, 0.60));
  label(format("%d", i + 1), p1, 1.25 * p1);
}

hexagono = hexagono -- cycle;
draw(hexagono, rgb(0.10, 0.25, 0.65) + linewidth(1.4));
draw(scale(R) * unitcircle, rgb(0.60, 0.60, 0.60) + dashed);

write("numero de triangulos = " + string(n));
write("area somada          = " + string(areaTotal));
write("area exata (3*sqrt(3)/2*R^2) = " + string(3 * sqrt(3) / 2 * R^2));
