// exercicio_9.as - contagem de vogais, inversao e normalizacao de texto
//
// Tarefa: sobre uma frase, contar vogais e consoantes, inverter o texto,
// substituir um trecho por outro e comparar maiusculas com minusculas.

bool ehVogal(const string &in letra)
{
    string l = letra;
    // Comparacao com as duas formas, ja que o tipo string nao tem toLower().
    return l == "a" || l == "e" || l == "i" || l == "o" || l == "u"
        || l == "A" || l == "E" || l == "I" || l == "O" || l == "U";
}

bool ehLetra(const string &in letra)
{
    return (letra >= "a" && letra <= "z") || (letra >= "A" && letra <= "Z");
}

string inverter(const string &in texto)
{
    string saida = "";
    for (int i = int(texto.length()) - 1; i >= 0; i--)
        saida += texto.substr(i, 1);
    return saida;
}

// Substitui todas as ocorrencias de "de" por "DO" usando substr.
string substituir(const string &in texto, const string &in alvo, const string &in novo)
{
    string saida = "";
    uint i = 0;
    while (i < texto.length())
    {
        if (i + alvo.length() <= texto.length() && texto.substr(i, alvo.length()) == alvo)
        {
            saida += novo;
            i += alvo.length();
        }
        else
        {
            saida += texto.substr(i, 1);
            i++;
        }
    }
    return saida;
}

void main()
{
    string frase = "O rato roeu a roupa do rei de Roma";

    int vogais = 0, letras = 0, espacos = 0;
    for (uint i = 0; i < frase.length(); i++)
    {
        string letra = frase.substr(i, 1);
        if (letra == " ")
            espacos++;
        if (ehLetra(letra))
        {
            letras++;
            if (ehVogal(letra))
                vogais++;
        }
    }

    print("frase: " + frase);
    print("caracteres: " + frase.length());
    print("letras: " + letras + ", vogais: " + vogais
          + ", consoantes: " + (letras - vogais) + ", espacos: " + espacos);
    print("invertida: " + inverter(frase));
    print("com substituicao: " + substituir(frase, "de", "DO"));
    print("posicao de \"rei\": " + frase.findFirst("rei"));
    print("trecho 2..12: " + frase.substr(2, 10));
    print("maiuscula != minuscula: " + ("Roma" != "roma"));
}
