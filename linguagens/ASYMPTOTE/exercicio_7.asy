// exercicio_7.asy -- Tratamento de erros: validacao de uma tabela de notas.
//
// Enunciado: receber um array de notas, aceitar apenas valores entre 0 e 10,
// recusar os demais com mensagem no terminal (sem abortar o programa) e
// desenhar um grafico de barras somente com as notas validas. A consistencia
// final e conferida com assert().
//
// Compilacao: asy -f pdf exercicio_7.asy

unitsize(1cm);

real[] brutas = {7.5, -1, 9, 12, 5.5, 8, 10.5, 6};

real[] validas;
int descartadas = 0;
for (int i = 0; i < brutas.length; ++i) {
  if (brutas[i] < 0 || brutas[i] > 10) {
    write("nota descartada na posicao " + string(i) + ": " + string(brutas[i]));
    descartadas = descartadas + 1;
  } else {
    validas.push(brutas[i]);
  }
}

// As duas verificacoes precisam passar para o programa continuar
assert(validas.length > 0, "nenhuma nota valida");
assert(validas.length + descartadas == brutas.length, "contagem inesperada");

// ---- grafico de barras -------------------------------------------
real largura = 0.7;
for (int i = 0; i < validas.length; ++i) {
  real h = validas[i] / 2;               // escala vertical
  path barra = box((i, 0), (i + largura, h));
  fill(barra, rgb(0.30, 0.55, 0.85) + opacity(0.5));
  draw(barra, rgb(0.10, 0.25, 0.55) + linewidth(1.1));
  label(format("%.1f", validas[i]), (i + largura / 2, h), N);
}

draw((-0.2, 0) -- (validas.length, 0), black + linewidth(1.2));
label(format("%d", validas.length) + " notas validas de "
      + format("%d", brutas.length),
      (validas.length / 2, -0.6), S);

// ---- media -------------------------------------------------------
real soma = 0;
for (int i = 0; i < validas.length; ++i) soma = soma + validas[i];
write("media das notas validas = " + string(soma / validas.length));
