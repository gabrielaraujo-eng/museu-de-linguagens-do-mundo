// exemplo_4.as - lacos: for, while, do-while, break e continue

void main()
{
    // for: inicializacao; condicao; incremento.
    // A variavel declarada no for existe apenas dentro do laco.
    int soma = 0;
    for (int i = 1; i <= 10; i++)
    {
        soma += i;
    }
    print("soma de 1 a 10 = " + soma);

    // while: a condicao e testada antes de cada iteracao.
    int contador = 3;
    while (contador > 0)
    {
        print("contagem regressiva: " + contador);
        contador--;
    }

    // do-while: o corpo executa pelo menos uma vez, mesmo com condicao falsa.
    int tentativas = 0;
    do
    {
        tentativas++;
    } while (false);
    print("corpo do do-while executou " + tentativas + " vez(es)");

    // continue salta para a proxima iteracao; break encerra o laco.
    string impares = "";
    for (int n = 0; n < 10; n++)
    {
        if (n % 2 == 0)
            continue;          // ignora os pares
        if (n > 7)
            break;             // para antes do fim
        impares += n + " ";
    }
    print("impares menores que 9: " + impares);

    // Lacos aninhados: tabuada de 1 a 3.
    for (int a = 1; a <= 3; a++)
    {
        string linha = "";
        for (int b = 1; b <= 3; b++)
        {
            linha += (a * b) + " ";
        }
        print(a + " x 1..3 = " + linha);
    }

    // for sem nenhuma das tres partes equivale a um laco infinito,
    // encerrado aqui por break.
    int passos = 0;
    for (;;)
    {
        passos++;
        if (passos == 5)
            break;
    }
    print("passos ate o break: " + passos);
}
