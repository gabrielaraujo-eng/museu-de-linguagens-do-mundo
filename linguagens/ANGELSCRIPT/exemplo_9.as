// exemplo_9.as - strings: o tipo string do add-on scriptstdstring
//
// O tipo string nao e primitivo: vem do add-on e precisa ser registrado pela
// aplicacao com RegisterStdString(). As operacoes trabalham com bytes, nao
// com caracteres Unicode: cada posicao e um byte.

void main()
{
    string nome = "AngelScript";
    string vazia = "";

    print("texto: " + nome);
    print("length: " + nome.length());
    print("isEmpty: " + vazia.isEmpty());

    // Concatenacao com + e +=, inclusive com tipos primitivos.
    string versao = "versao " + 2.38;
    print(versao);
    string cumprimento = "Ola, ";
    cumprimento += nome;
    cumprimento += "!";
    print(cumprimento);

    // substr(posicao, quantidade); sem o segundo argumento vai ate o fim.
    print("substr(0, 5): " + nome.substr(0, 5));
    print("substr(5): " + nome.substr(5));

    // findFirst devolve o indice ou valor negativo; findLast busca do fim.
    print("findFirst(\"Script\"): " + nome.findFirst("Script"));
    print("findLast(\"g\"): " + nome.findLast("g"));
    print("findFirst(\"xyz\"): " + nome.findFirst("xyz"));

    // insercao e remocao em posicoes arbitrarias.
    string editada = nome;
    editada.insert(5, "-");
    print("apos insert(5, \"-\"): " + editada);
    editada.erase(5, 1);
    print("apos erase(5, 1): " + editada);

    // Comparacao: ==, != e ordenacao lexicografica por valor de byte.
    print("\"abc\" == \"abc\": " + ("abc" == "abc"));
    print("\"abc\" < \"abd\": " + ("abc" < "abd"));

    // Percorrer byte a byte com substr(i, 1).
    string invertida = "";
    for (int i = int(nome.length()) - 1; i >= 0; i--)
        invertida += nome.substr(i, 1);
    print("invertida: " + invertida);

    // Contar ocorrencias de um caractere usando substr.
    string frase = "banana";
    int totalA = 0;
    for (uint i = 0; i < frase.length(); i++)
    {
        if (frase.substr(i, 1) == "a")
            totalA++;
    }
    print("ocorrencias de 'a' em \"" + frase + "\": " + totalA);

    // Formatar numeros: formatFloat(valor, opcoes, largura, casas decimais)
    // e formatInt(valor, opcoes, largura) vem do add-on scriptstdstring.
    print("formatFloat(pi, \"\", 0, 3) = " + formatFloat(3.14159265, "", 0, 3));
    print("formatInt(255, \"H\", 0) = " + formatInt(255, "H", 0));
    print("formatInt(42, \"0\", 5) = " + formatInt(42, "0", 5));
}
