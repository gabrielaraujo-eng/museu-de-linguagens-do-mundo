// exemplo_6.as - array<T>: a lista dinamica do add-on scriptarray
//
// array<T> nao e um tipo do nucleo: a aplicacao hospedeira precisa chamar
// RegisterScriptArray(). Os elementos ficam em memoria contigua e o tipo T
// e resolvido em tempo de compilacao.

void main()
{
    // Inicializacao com lista de valores.
    array<int> numeros = {5, 3, 9, 1, 7};

    print("tamanho inicial: " + numeros.length());
    print("primeiro elemento: " + numeros[0]);

    // Insercao no fim e em posicao arbitraria.
    numeros.insertLast(4);
    numeros.insertAt(0, 100);
    print("apos insertLast e insertAt(0): " + numeros.length() + " elementos, primeiro = " + numeros[0]);

    // Remocao por posicao e do ultimo.
    numeros.removeAt(0);   // tira o 100
    numeros.removeLast();  // tira o 4
    print("apos remocoes: " + numeros.length() + " elementos");

    // Percursos: for com indice e foreach.
    string lista = "";
    for (uint i = 0; i < numeros.length(); i++)
    {
        lista += numeros[i] + " ";
    }
    print("na ordem original: " + lista);

    int total = 0;
    foreach (int valor : numeros)
    {
        total += valor;
    }
    print("soma com foreach: " + total);

    // Ordenacao e inversao sao metodos do proprio array.
    numeros.sortAsc();
    lista = "";
    foreach (int valor : numeros)
        lista += valor + " ";
    print("ordenado crescente: " + lista);

    numeros.sortDesc();
    lista = "";
    foreach (int valor : numeros)
        lista += valor + " ";
    print("ordenado decrescente: " + lista);

    numeros.reverse();
    print("invertido, primeiro = " + numeros[0]);

    // find devolve o indice ou um valor negativo se nao encontrar.
    print("indice de 7: " + numeros.find(7));
    print("indice de 42: " + numeros.find(42));

    // Arrays de outros tipos, inclusive de objetos gerenciados.
    array<double> pesos = {70.5, 82.0, 65.25};
    double somaPesos = 0;
    foreach (double p : pesos)
        somaPesos += p;
    print("media dos pesos: " + (somaPesos / pesos.length()));

    array<string> nomes = {"Ana", "Bruno", "Carla"};
    nomes.sortAsc();
    print("nomes ordenados: " + nomes[0] + ", " + nomes[1] + ", " + nomes[2]);

    // resize ajusta o tamanho; os novos elementos recebem o valor padrao do tipo.
    numeros.resize(3);
    print("apos resize(3): " + numeros.length() + " elementos");
}
