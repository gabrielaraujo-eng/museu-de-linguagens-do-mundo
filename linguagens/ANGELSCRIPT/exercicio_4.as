// exercicio_4.as - soma dos pares de 1 a 20 e tabuada com while
//
// Tarefa: somar os numeros pares de 1 a 20 com for, imprimir a tabuada de
// um numero com while e mostrar o fatorial de 6 com do-while.

void main()
{
    // Soma dos pares com for e passo 2.
    int somaPares = 0;
    for (int n = 2; n <= 20; n += 2)
        somaPares += n;
    print("soma dos pares de 1 a 20 = " + somaPares);

    // Mesma soma com while, para comparar as duas formas.
    int somaWhile = 0;
    int i = 1;
    while (i <= 20)
    {
        if (i % 2 == 0)
            somaWhile += i;
        i++;
    }
    print("soma conferida com while = " + somaWhile);

    // Tabuada de 7 com while.
    int multiplicador = 1;
    while (multiplicador <= 10)
    {
        print("7 x " + multiplicador + " = " + (7 * multiplicador));
        multiplicador++;
    }

    // Fatorial com do-while: o corpo sempre executa ao menos uma vez.
    int fat = 1;
    int k = 6;
    do
    {
        fat *= k;
        k--;
    } while (k > 1);
    print("6! = " + fat);

    // Contagem de multiplos de 3 entre 1 e 30, pulando os demais com continue.
    int multiplos = 0;
    for (int m = 1; m <= 30; m++)
    {
        if (m % 3 != 0)
            continue;
        multiplos++;
        if (multiplos == 10)
            break;   // para exatamente no decimo multiplo
    }
    print("multiplos de 3 contados: " + multiplos + " (ultimo: " + (multiplos * 3) + ")");
}
