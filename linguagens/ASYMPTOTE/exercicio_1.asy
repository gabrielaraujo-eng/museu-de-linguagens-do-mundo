// exercicio_1.asy -- Primeiros passos: quadrado, vertices e diagonal.
//
// Enunciado: desenhar um quadrado de lado 3 com os quatro vertices
// marcados e rotulados, tracar uma diagonal e informar no terminal o
// perimetro e a area da figura.
//
// Compilacao: asy -f pdf exercicio_1.asy

unitsize(1cm);

real lado = 3;

// Quatro vertices
pair A = (0, 0);
pair B = (lado, 0);
pair C = (lado, lado);
pair D = (0, lado);

path quadrado = A -- B -- C -- D -- cycle;

fill(quadrado, rgb(0.90, 0.94, 1.00));
draw(quadrado, rgb(0.10, 0.25, 0.65) + linewidth(1.3));
draw(A -- C, rgb(0.80, 0.20, 0.20) + dashed);   // diagonal

dot(A); dot(B); dot(C); dot(D);
label("A", A, SW);
label("B", B, SE);
label("C", C, NE);
label("D", D, NW);

label(format("lado = %g", lado), (lado / 2, -0.45), S);
label("diagonal", (lado / 2, lado / 2), NE);

write("perimetro = " + string(4 * lado));
write("area      = " + string(lado^2));
write("diagonal  = " + string(length(C - A)));
