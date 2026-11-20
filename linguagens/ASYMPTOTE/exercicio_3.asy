// exercicio_3.asy -- Controle de fluxo: semaforo de tres estados.
//
// Enunciado: dado um estado inteiro (0 = fechado, 1 = atencao, 2 = aberto),
// desenhar um semaforo em que apenas a luz correspondente fica acesa,
// usando if / else if / else. Estados fora do intervalo devem ser
// sinalizados no terminal.
//
// Compilacao: asy -f pdf exercicio_3.asy

unitsize(1cm);

int estado = 2;                 // experimente 0, 1, 2 ou 9

real raio = 0.45;
pair[] centros = {(0, 2.2), (0, 1.1), (0, 0)};

// Corpo do semaforo
fill(box((-0.8, -0.7), (0.8, 2.9)), rgb(0.15, 0.15, 0.17));
draw(box((-0.8, -0.7), (0.8, 2.9)), black + linewidth(1.2));

// Cores das luzes
pen vermelho = rgb(0.85, 0.10, 0.10);
pen amarelo  = rgb(0.95, 0.75, 0.05);
pen verde    = rgb(0.10, 0.65, 0.25);
pen apagado  = rgb(0.28, 0.28, 0.30);

// Apenas uma luz acesa, decidida por if/else if/else
if (estado == 0) {
  fill(circle(centros[0], raio), vermelho);
  write("estado 0: fechado");
} else if (estado == 1) {
  fill(circle(centros[1], raio), amarelo);
  write("estado 1: atencao");
} else if (estado == 2) {
  fill(circle(centros[2], raio), verde);
  write("estado 2: aberto");
} else {
  write("estado invalido: " + string(estado));
  label("estado invalido", (0, -1.3), S);
}

// As outras duas luzes ficam apagadas
for (int i = 0; i < 3; ++i) {
  if (i != estado) fill(circle(centros[i], raio), apagado);
  draw(circle(centros[i], raio), black + linewidth(1.1));
}
