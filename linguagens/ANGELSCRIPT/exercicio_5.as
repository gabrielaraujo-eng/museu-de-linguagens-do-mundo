// exercicio_5.as - potencia recursiva e divisao com parametros &out
//
// Tarefa: calcular potencia por recursao, devolver quociente e resto por
// parametros de saida e demonstrar uma sobrecarga de funcao.

// Potencia inteira por recursao, com expoente nao negativo.
int potencia(int base, int expoente)
{
    if (expoente < 0)
        return 0;                       // nao suportado neste exercicio
    if (expoente == 0)
        return 1;                       // caso base
    return base * potencia(base, expoente - 1);
}

// Versao com expoente padrao 2.
int potencia(int base)
{
    return potencia(base, 2);
}

// Duas saidas ao mesmo tempo, sem usar struct.
void divisaoInteira(int a, int b, int &out quociente, int &out resto)
{
    quociente = a / b;
    resto     = a % b;
}

// Soma dos digitos: usa recursao e o resto da divisao por 10.
int somaDigitos(int n)
{
    if (n < 10)
        return n;
    return (n % 10) + somaDigitos(n / 10);
}

void main()
{
    print("2^10 = " + potencia(2, 10));
    print("3^4  = " + potencia(3, 4));
    print("5^0  = " + potencia(5, 0));
    print("7^2 (sobrecarga com padrao) = " + potencia(7));

    int q, r;
    divisaoInteira(1234, 10, q, r);
    print("1234 / 10 = " + q + " resto " + r);
    divisaoInteira(99, 7, q, r);
    print("99 / 7 = " + q + " resto " + r);

    print("soma dos digitos de 98765 = " + somaDigitos(98765));

    // Chamada recursiva dentro de expressao.
    int total = 0;
    for (int n = 1; n <= 5; n++)
        total += potencia(2, n);
    print("2^1 + ... + 2^5 = " + total);
}
