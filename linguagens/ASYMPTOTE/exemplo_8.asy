// exemplo_8.asy -- Manipulacao de strings.
//
// Compilacao: asy -f pdf exemplo_8.asy

unitsize(1cm);

string nome = "Asymptote";

// length() devolve o numero de caracteres
int n = length(nome);
write("nome = " + nome);
write("comprimento = " + string(n));

// Concatenacao com +
string titulo = nome + " - graficos vetoriais";
write(titulo);

// format() monta texto a partir de valores
string numeros = format("%d", 12) + " aulas, media " + format("%.2f", 8.375);
write(numeros);

// percorre os caracteres construindo uma escada de rotulos
for (int i = 1; i <= n; ++i) {
  string pedaco = substr(nome, 0, i - 1);   // primeiros i caracteres
  label(pedaco, (0, i * 0.55), W);
  draw((0, i * 0.55) -- (length(pedaco) * 0.18 + 0.2, i * 0.55),
       rgb(0.20, 0.20, 0.60));
}

label(titulo, (2.2, 0.6), W);
label(numeros, (2.2, 0.0), W);
