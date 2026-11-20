// exemplo_10.asy -- Conceito avancado: recursao e arvore fractal.
//
// Compilacao: asy -f pdf exemplo_10.asy

unitsize(0.5cm);

// Desenha um galho que sai de 'origem', cresce 'comp' na direcao 'ang'
// (em graus) e se ramifica recursivamente.
void galho(pair origem, real comp, real ang, int profundidade) {
  if (profundidade == 0) return;             // caso base da recursao

  pair fim = origem + comp * dir(ang);
  draw(origem -- fim,
       rgb(0.35, 0.22, 0.10) + linewidth(0.35 * profundidade));

  galho(fim, comp * 0.72, ang + 28, profundidade - 1);
  galho(fim, comp * 0.72, ang - 28, profundidade - 1);
}

galho((0, -6), 4.2, 90, 7);

label("arvore binaria com 7 niveis de recursao", (0, -7.2), S);

// Contagem de galhos: 2^0 + 2^1 + ... + 2^(n-1)
int niveis = 7;
int total = 0;
for (int i = 0; i < niveis; ++i) total = total + 2^i;
write("niveis = " + string(niveis));
write("segmentos desenhados = " + string(total));
