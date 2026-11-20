// exemplo_3.asy -- Controle de fluxo: if / else if / else.
//
// Compilacao: asy -f pdf exemplo_3.asy

// Converte um par ordenado em texto (string(pair) nao existe na biblioteca)
string texto(pair p) { return "(" + string(p.x) + ", " + string(p.y) + ")"; }

unitsize(1cm);

pair[] pontos = {(2, 1), (-1.5, 2), (-2, -2.5), (3, -1), (0, 2.5)};

// Eixos com seta (Arrow e definido na biblioteca padrao)
draw((-4, 0) -- (4, 0), arrow = Arrow);
draw((0, -3.5) -- (0, 3.5), arrow = Arrow);
label("x", (4, 0), E);
label("y", (0, 3.5), N);

for (int i = 0; i < pontos.length; ++i) {
  pair p = pontos[i];
  pen cor;
  string nome;

  if (p.x > 0 && p.y > 0) {
    cor  = rgb(0.85, 0.10, 0.10);
    nome = "QI";
  } else if (p.x < 0 && p.y > 0) {
    cor  = rgb(0.10, 0.55, 0.10);
    nome = "QII";
  } else if (p.x < 0 && p.y < 0) {
    cor  = rgb(0.10, 0.20, 0.75);
    nome = "QIII";
  } else {
    cor  = rgb(0.70, 0.45, 0.00);
    nome = "QIV";
  }

  dot(p, cor + linewidth(2));
  label(nome, p, N);
  write(nome + " -> " + texto(p));
}
