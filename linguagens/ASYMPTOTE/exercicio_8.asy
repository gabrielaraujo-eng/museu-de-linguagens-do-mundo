// exercicio_8.asy -- Strings: rotulos montados a partir de nomes e valores.
//
// Enunciado: para uma lista de meses e valores de chuva, abreviar os nomes
// com substr(), formatar os valores com format(), concatenar tudo em um
// rotulo e desenhar um grafico de barras horizontais com esses rotulos.
//
// Compilacao: asy -f pdf exercicio_8.asy

unitsize(1cm);

string[] meses = {"Janeiro", "Fevereiro", "Marco", "Abril", "Maio"};
real[]   chuva = {210.5, 180.0, 145.3, 90.7, 62.4};

real maximo = 0;
for (int i = 0; i < chuva.length; ++i) maximo = max(maximo, chuva[i]);

for (int i = 0; i < meses.length; ++i) {
  // Abrevia os tres primeiros caracteres: substr(s, inicio, fim)
  string abrev = substr(meses[i], 0, 2);
  string rotulo = abrev + " - " + format("%.1f mm", chuva[i]);
  real comp = 4 * chuva[i] / maximo;

  real y = (meses.length - 1 - i) * 0.9;
  fill(box((0, y), (comp, y + 0.6)), rgb(0.20, 0.45, 0.70) + opacity(0.55));
  draw(box((0, y), (comp, y + 0.6)), rgb(0.10, 0.25, 0.45));
  label(rotulo, (-0.15, y + 0.3), E);
}

draw((0, -0.3) -- (0, meses.length * 0.9 - 0.3), black + linewidth(1.2));

string titulo = "chuva mensal (" + format("%d", meses.length) + " meses)";
label(titulo, (2, -0.8), S);
write(titulo);
write("comprimento do titulo = " + string(length(titulo)));
write("maior valor = " + string(maximo));
