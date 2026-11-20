// exemplo_8.as - interfaces, handles e polimorfismo
//
// Uma interface declara metodos sem corpo. Uma classe a implementa e pode
// ser acessada por um handle do tipo da interface, o que da polimorfismo.

interface IForma
{
    double area() const;
    double perimetro() const;
    string nome() const;
}

class Retangulo : IForma
{
    private double base;
    private double altura;

    Retangulo(double b, double h)
    {
        base = b;
        altura = h;
    }

    double area() const { return base * altura; }
    double perimetro() const { return 2 * (base + altura); }
    string nome() const { return "retangulo"; }
}

class Circulo : IForma
{
    private double raio;

    Circulo(double r)
    {
        raio = r;
    }

    double obterRaio() const { return raio; }
    double area() const { return 3.14159265358979 * raio * raio; }
    double perimetro() const { return 2 * 3.14159265358979 * raio; }
    string nome() const { return "circulo"; }
}

// A funcao recebe qualquer objeto que implemente IForma.
void descrever(IForma@ forma)
{
    print(forma.nome() + ": area = " + forma.area()
          + ", perimetro = " + forma.perimetro());
}

void main()
{
    Retangulo r(4.0, 2.5);
    Circulo   c(1.5);

    // Conversao implicita de handle da classe para handle da interface.
    IForma@ f1 = r;
    IForma@ f2 = c;
    descrever(f1);
    descrever(f2);

    // O metodo chamado depende do objeto real, nao do tipo da variavel.
    IForma@ atual = f1;
    @atual = f2;                    // atribuicao de handle usa @
    print("agora apontando para: " + atual.nome());

    // Conversao explicita de volta para a classe concreta com cast<>.
    // Se o objeto nao for do tipo pedido, o resultado e null.
    Circulo@ comoCirculo = cast<Circulo>(atual);
    if (comoCirculo !is null)
        print("raio recuperado: " + comoCirculo.obterRaio());

    IForma@ semCast = cast<Retangulo>(f2);
    print("cast de Circulo para Retangulo devolve null: " + (semCast is null));

    // Somar as areas de todas as formas de um array de handles de interface.
    array<IForma@> formas;
    formas.insertLast(@r);
    formas.insertLast(@c);
    formas.insertLast(@Circulo(2.0));

    double soma = 0;
    for (uint i = 0; i < formas.length(); i++)
        soma += formas[i].area();
    print("area total das " + formas.length() + " formas = " + soma);

    // Handle nulo: chamar um metodo nele gera excecao em tempo de execucao.
    IForma@ nulo = null;
    if (nulo is null)
        print("handle de interface nulo nao foi usado");
}
