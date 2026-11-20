// Museu de Linguagens do Mundo -- pasta ASYMPTOTE
// exemplo_1.asy -- Primeiro desenho: unidades, pontos, caminho e rotulo.
//
// Compilacao:  asy -f pdf exemplo_1.asy
//              asy -f png exemplo_1.asy
//
// Em Asymptote todo programa e uma sequencia de comandos que desenham
// em uma "picture" (a figura corrente). O arquivo nao tem funcao main:
// as instrucoes do nivel superior sao executadas em ordem.

// Converte um par ordenado em texto (string(pair) nao existe na biblioteca)
string texto(pair p) { return "(" + string(p.x) + ", " + string(p.y) + ")"; }

unitsize(1cm);                    // 1 unidade do usuario = 1 centimetro

pair A = (0, 0);                  // pair = par ordenado de reais
pair B = (4, 2);

path reta = A -- B;               // -- cria um segmento de reta

draw(reta, blue + linewidth(1.2));
dot(A, red);                      // marca o ponto A
dot(B, red);

label("A", A, SW);                // rotulo alinhado a sudoeste do ponto
label("B", B, NE);
label("primeiro desenho em Asymptote", (2, 2.6));

// Saida no terminal (nao faz parte da figura)
write("A = " + texto(A));
write("B = " + texto(B));
write("comprimento do segmento = " + string(length(B - A)));
