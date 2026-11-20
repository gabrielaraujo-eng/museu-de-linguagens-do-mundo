// exemplo_3.as - condicionais: if / else if / else e switch
//
// A condicao de um if precisa ser uma expressao bool: AngelScript nao
// aceita inteiro como verdadeiro, como fazem C e C++.

// Funcao auxiliar que devolve uma descricao textual para uma nota.
string conceito(double nota)
{
    if (nota >= 9.0)
        return "A";
    else if (nota >= 7.0)
        return "B";
    else if (nota >= 5.0)
        return "C";
    else
        return "D";
}

void main()
{
    double nota = 7.5;

    if (nota >= 7.0 && nota < 9.0)
        print("Aprovado com conceito " + conceito(nota));
    else if (nota >= 9.0)
        print("Aprovado com distincao");
    else
        print("Reprovado");

    // Negacao e disjuncao com ! e ||.
    bool temBonus = false;
    if (!temBonus || nota > 8.0)
        print("Sem bonus aplicavel");

    // if encadeado sem chaves: apenas a instrucao seguinte pertence ao ramo.
    int faltas = 3;
    if (faltas == 0) print("Presenca integral");

    // switch funciona com expressao inteira (signed ou unsigned).
    // Cada case precisa de break, senao o fluxo continua no case seguinte.
    int dia = 4;
    switch (dia)
    {
    case 1:
        print("segunda-feira");
        break;
    case 4:
    case 5:
        // dois rotulos para o mesmo trecho: fim de semana chegando
        print("quinta ou sexta");
        break;
    case 6:
    case 7:
        print("fim de semana");
        break;
    default:
        print("dia invalido");
        break;
    }

    // O valor de um case pode ser uma constante inicializada em tempo de compilacao.
    const int CODIGO_OK = 200;
    int codigo = 200;
    switch (codigo)
    {
    case CODIGO_OK:
        print("resposta 200: ok");
        break;
    default:
        print("outro codigo");
        break;
    }
}
