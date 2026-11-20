// exemplo_5.as - funcoes: retorno, sobrecarga, argumentos padrao,
// parametros por referencia e recursao

// Funcao simples com dois parametros por valor.
int somar(int a, int b)
{
    return a + b;
}

// Sobrecarga: mesmo nome, assinatura diferente. O compilador escolhe
// pela quantidade e pelos tipos dos argumentos.
double somar(double a, double b)
{
    return a + b;
}

string somar(const string &in a, const string &in b)
{
    return a + b;
}

// Argumento com valor padrao: precisa ficar a direita dos demais.
int potencia(int base, int expoente = 2)
{
    int resultado = 1;
    for (int i = 0; i < expoente; i++)
        resultado *= base;
    return resultado;
}

// Parametro &out: a funcao escreve no argumento do chamador.
// Parametro &inout: le e escreve. Parametro &in: apenas leitura, sem copia.
void dividir(int dividendo, int divisor, int &out quociente, int &out resto)
{
    quociente = dividendo / divisor;
    resto     = dividendo % divisor;
}

void dobrarEmTexto(const string &in texto, string &out dobro)
{
    dobro = texto + " " + texto;
}

// Recursao: a funcao chama a si mesma com um caso menor.
int fatorial(int n)
{
    if (n <= 1)
        return 1;               // caso base
    return n * fatorial(n - 1); // caso recursivo
}

// Funcao void pode ter return sem expressao para sair antes do fim.
void avisarSeNegativo(int valor)
{
    if (valor >= 0)
        return;
    print("valor negativo: " + valor);
}

void main()
{
    print("int:    " + somar(2, 3));
    print("double: " + somar(2.5, 0.25));
    print("string: " + somar("Angel", "Script"));

    print("potencia(5)    = " + potencia(5));      // usa o padrao 2
    print("potencia(2, 10) = " + potencia(2, 10));

    int q, r;
    dividir(17, 5, q, r);
    print("17 / 5 = " + q + " resto " + r);

    string texto = "eco";
    string dobro;
    dobrarEmTexto(texto, dobro);
    print("por referencia de saida: " + dobro);

    print("5! = " + fatorial(5));
    avisarSeNegativo(-3);
    avisarSeNegativo(4);
}
