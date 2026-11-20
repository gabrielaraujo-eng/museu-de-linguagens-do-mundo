// exemplo_7.asy -- Tratamento de erros: verificacao de pre-condicoes com assert.
//
// Asymptote nao possui try/catch: o programa aborta com mensagem quando uma
// condicao falha. A pratica recomendada e validar entradas com assert()
// antes de usa-las e tratar os casos invalidos por decisao explicita.

unitsize(1cm);

// ---- funcao que exige dominio valido ------------------------------
real raiz(real x) {
  assert(x >= 0, "raiz(): argumento negativo");
  return sqrt(x);
}

// ---- funcao que devolve um codigo de erro em vez de abortar -------
// 0 = ok, 1 = lados invalidos, 2 = triangulo impossivel
int classificaTriangulo(real a, real b, real c) {
  if (a <= 0 || b <= 0 || c <= 0) return 1;
  if (a + b <= c || a + c <= b || b + c <= a) return 2;
  return 0;
}

void desenhaTriangulo(real a, real b, real c) {
  int estado = classificaTriangulo(a, b, c);
  if (estado != 0) {
    write("dados invalidos (codigo " + string(estado) + "): a=" + string(a) + " b=" + string(b) + " c=" + string(c));
    label("invalido: " + format("%.1f", a) + ", " + format("%.1f", b)
        + ", " + format("%.1f", c), (2, 3), N);
    return;                                  // saida antecipada
  }
  // Construcao: base a no eixo x, terceiro vertice por lei dos cossenos
  real x = (a^2 + b^2 - c^2) / (2 * a);
  real y = sqrt(max(b^2 - x^2, 0));
  path t = (0, 0) -- (a, 0) -- (x, y) -- cycle;
  fill(t, rgb(0.80, 0.90, 0.85));
  draw(t, rgb(0.10, 0.40, 0.30) + linewidth(1.2));
  write("triangulo valido: a=" + string(a) + " b=" + string(b) + " c=" + string(c));
}

// ---- uso ----------------------------------------------------------
write("raiz(9) = " + string(raiz(9)));
assert(classificaTriangulo(3, 4, 5) == 0, "3-4-5 deveria ser valido");

desenhaTriangulo(3, 4, 5);          // valido: desenha
desenhaTriangulo(1, 1, 5);          // impossivel: apenas mensagem

// max() evita raiz de numero negativo em casos degenerados
write("max(0, -2) = " + string(max(0, -2)));
