// exemplo_6.asy -- Estruturas de dados: struct, arrays e metodos.
//
// Compilacao: asy -f pdf exemplo_6.asy

unitsize(1cm);

// ---- definicao do tipo -------------------------------------------
struct Retangulo {
  pair canto;          // canto inferior esquerdo
  real larg, alt;      // dimensoes

  // construtor chamado por Retangulo(...)
  void operator init(pair canto, real larg, real alt) {
    this.canto = canto;
    this.larg  = larg;
    this.alt   = alt;
  }

  real area() { return larg * alt; }

  path contorno() { return box(canto, canto + (larg, alt)); }
}

// ---- vetor de estruturas -----------------------------------------
Retangulo[] lista = {Retangulo((0, 0), 3, 2),
                     Retangulo((4, 0), 1.5, 3),
                     Retangulo((6.5, 0), 2, 1)};

pen[] cores = {rgb(0.85, 0.35, 0.25), rgb(0.25, 0.55, 0.85), rgb(0.35, 0.70, 0.35)};

real areaTotal = 0;
for (int i = 0; i < lista.length; ++i) {
  Retangulo r = lista[i];
  fill(r.contorno(), cores[i] + opacity(0.35));
  draw(r.contorno(), cores[i] + linewidth(1.2));
  label(format("%.1f", r.area()), r.canto + (r.larg / 2, r.alt / 2));
  areaTotal = areaTotal + r.area();
}

write("numero de retangulos = " + string(lista.length));
write("area total = " + string(areaTotal));

// Array comum de pares, para comparacao
pair[] marcadores = {(0.5, 0.5), (4.7, 1.5)};
for (int i = 0; i < marcadores.length; ++i)
  dot(marcadores[i], black);
