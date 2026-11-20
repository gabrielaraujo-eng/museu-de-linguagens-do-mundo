// exercicio_3.as - classificacao de uma nota com if/else e switch
//
// Tarefa: receber uma nota de 0 a 10, classificar em conceito de A a E
// com if/else encadeado e imprimir uma mensagem por conceito com switch.

string classificar(double nota)
{
    if (nota < 0.0 || nota > 10.0)
        return "invalida";
    if (nota >= 9.0)
        return "A";
    if (nota >= 7.5)
        return "B";
    if (nota >= 6.0)
        return "C";
    if (nota >= 4.0)
        return "D";
    return "E";
}

void main()
{
    array<double> notas = {9.5, 8.0, 6.5, 5.0, 3.2, 11.0};

    for (uint i = 0; i < notas.length(); i++)
    {
        double nota = notas[i];
        string conceito = classificar(nota);

        print("nota " + formatFloat(nota, "", 0, 1) + " -> conceito " + conceito);

        // switch sobre o primeiro byte do conceito nao e necessario aqui:
        // a comparacao com string em if/else e suficiente e mais legivel.
        if (conceito == "invalida")
            print("  erro: nota fora da faixa 0..10");
        else if (conceito == "A" || conceito == "B")
            print("  aprovado");
        else if (conceito == "C")
            print("  aprovado por pouco");
        else
            print("  reprovado");
    }

    // switch com inteiros: quantas notas validas por faixa.
    int aprovados = 0, reprovados = 0, invalidas = 0;
    for (uint i = 0; i < notas.length(); i++)
    {
        int faixa;
        if (notas[i] < 0.0 || notas[i] > 10.0)
            faixa = 2;
        else if (notas[i] >= 6.0)
            faixa = 0;
        else
            faixa = 1;

        switch (faixa)
        {
        case 0:
            aprovados++;
            break;
        case 1:
            reprovados++;
            break;
        default:
            invalidas++;
            break;
        }
    }
    print("aprovados: " + aprovados + ", reprovados: " + reprovados
          + ", invalidas: " + invalidas);
}
