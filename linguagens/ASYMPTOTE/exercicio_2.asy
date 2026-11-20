// exercicio_2.asy -- Variaveis e tipos: conversao de unidades.
//
// Enunciado: guardar as dimensoes de uma sala em metros (real), converter
// para pes (1 m = 3.28084 pes) e desenhar a planta baixa em escala, com
// as medidas escritas nos dois sistemas.
//
// Compilacao: asy -f pdf exercicio_2.asy

unitsize(0.8cm);

real larguraMetros = 5.0;
real alturaMetros  = 3.2;
real pesPorMetro   = 3.28084;

// Conversao explicita para real
real larguraPes = larguraMetros * pesPorMetro;
real alturaPes  = alturaMetros  * pesPorMetro;

path sala = box((0, 0), (larguraMetros, alturaMetros));

fill(sala, rgb(0.96, 0.95, 0.88));
draw(sala, rgb(0.35, 0.30, 0.20) + linewidth(1.4));

// Cota horizontal
draw((0, -0.45) -- (larguraMetros, -0.45), rgb(0.55, 0.10, 0.10));
draw((0, -0.60) -- (0, -0.30), rgb(0.55, 0.10, 0.10));
draw((larguraMetros, -0.60) -- (larguraMetros, -0.30), rgb(0.55, 0.10, 0.10));
label(format("%.1f", larguraMetros) + " m / " + format("%.1f", larguraPes) + " pes",
      (larguraMetros / 2, -0.75), S);

// Cota vertical
label(format("%.1f m", alturaMetros), (-0.25, alturaMetros / 2), W);
label(format("%.1f pes", alturaPes), (-0.25, alturaMetros / 2 - 0.45), W);

write("largura em pes = " + string(larguraPes));
write("altura em pes  = " + string(alturaPes));
write("area em m2     = " + string(larguraMetros * alturaMetros));
write("area em pes2   = " + string(larguraPes * alturaPes));
