// exercicio_6.as - array de notas: estatisticas e ordenacao manual
//
// Tarefa: guardar seis notas em array<double>, calcular maior, menor e
// media, e ordenar com o algoritmo de troca (bubble sort) escrito no script,
// sem usar o metodo sortAsc() do add-on.

void ordenarPorTroca(array<double> &inout valores)
{
    int n = int(valores.length());
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = 0; j < n - 1 - i; j++)
        {
            if (valores[j] > valores[j + 1])
            {
                double temp = valores[j];
                valores[j] = valores[j + 1];
                valores[j + 1] = temp;
            }
        }
    }
}

void main()
{
    array<double> notas = {7.5, 9.0, 4.25, 10.0, 6.0, 8.75};

    // Estatisticas em uma unica passagem.
    double maior = notas[0];
    double menor = notas[0];
    double soma = 0;
    foreach (double nota : notas)
    {
        if (nota > maior) maior = nota;
        if (nota < menor) menor = nota;
        soma += nota;
    }
    double media = soma / notas.length();

    print("notas: " + notas.length());
    print("maior = " + maior);
    print("menor = " + menor);
    print("media = " + formatFloat(media, "", 0, 3));

    // Ordenacao manual.
    ordenarPorTroca(notas);
    string ordenadas = "";
    foreach (double nota : notas)
        ordenadas += formatFloat(nota, "", 0, 2) + " ";
    print("ordenadas: " + ordenadas);

    // Mediana: com quantidade par, media dos dois centrais.
    int meio = int(notas.length()) / 2;
    double mediana = (notas[meio - 1] + notas[meio]) / 2.0;
    print("mediana = " + mediana);

    // Quantas notas ficaram acima da media.
    int acima = 0;
    foreach (double nota : notas)
    {
        if (nota > media)
            acima++;
    }
    print("acima da media: " + acima);

    // Conferencia com o metodo do add-on.
    array<double> copia = notas;
    copia.sortDesc();
    print("maior pela ordenacao do add-on: " + copia[0]);
}
