// exercicio_9.asy -- Matematica: circulo trigonometrico e angulo de 30 graus.
//
// Enunciado: desenhar o circulo unitario, o arco de 30 graus, o raio ate o
// ponto correspondente e as projecoes de seno e cosseno; calcular e exibir
// os valores numericos.
//
// Compilacao: asy -f pdf exercicio_9.asy

unitsize(3cm);

real graus = 30;
real rad   = radians(graus);         // radians() converte graus em radianos
pair P     = (cos(rad), sin(rad));

// circulo unitario
draw(unitcircle, rgb(0.55, 0.55, 0.55));
draw((-1.25, 0) -- (1.25, 0), arrow = Arrow);
draw((0, -1.25) -- (0, 1.25), arrow = Arrow);
label("x", (1.25, 0), E);
label("y", (0, 1.25), N);

// arco de 0 a 30 graus, construido ponto a ponto
path arco;
int passos = 30;
for (int i = 0; i <= passos; ++i) {
  real a = rad * i / passos;
  pair q = (cos(a), sin(a));
  if (i == 0) arco = q; else arco = arco -- q;
}
draw(arco, rgb(0.85, 0.20, 0.15) + linewidth(1.6));

// raio e projecoes
draw((0, 0) -- P, rgb(0.10, 0.25, 0.70) + linewidth(1.2));
draw(P -- (P.x, 0), rgb(0.20, 0.55, 0.25) + dashed);
draw(P -- (0, P.y), rgb(0.70, 0.45, 0.00) + dashed);
dot(P, black);
label("P", P, NE);
label(format("cos 30 = %.4f", P.x), (P.x / 2, -0.10), S);
label(format("sin 30 = %.4f", P.y), (-0.08, P.y / 2), W);

write("angulo em radianos = " + string(rad));
write("cos(30) = " + string(P.x));
write("sin(30) = " + string(P.y));
write("cos^2 + sin^2 = " + string(P.x^2 + P.y^2));
