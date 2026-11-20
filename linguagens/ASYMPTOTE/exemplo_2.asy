// exemplo_2.asy -- Variaveis, tipos (real, int, pair, pen, path) e preenchimento.
//
// Compilacao: asy -f pdf exemplo_2.asy

unitsize(1cm);

// Tipos numericos basicos
int   lados  = 3;
real  base   = 4.0;
real  altura = 3.0;

// pen = caneta (cor + espessura + estilo)
pen contorno = rgb(0.10, 0.20, 0.60) + linewidth(1.4);
pen miolo    = rgb(0.85, 0.90, 1.00);

// path = caminho; -- liga pontos e cycle fecha o caminho
path triangulo = (0, 0) -- (base, 0) -- (base / 2, altura) -- cycle;

fill(triangulo, miolo);           // pinta o interior
draw(triangulo, contorno);        // desenha o contorno

// Rotulos: format() converte numeros em texto
label("base = " + format("%.1f", base), (base / 2, 0), S);
label("altura = " + format("%.1f", altura), (base / 2, altura / 2), E);
label(format("%d lados", lados), (base / 2, altura / 2));

// Calculos com os mesmos valores
real area = base * altura / 2;
write("area do triangulo = " + string(area));

// Uma elipse transladada, para mostrar transformacoes de caminho
draw(shift(6, 1.5) * scale(2, 1) * unitcircle, contorno);
