// exemplo_7.as - classes: construtor, destrutor, atributos e propriedades
//
// Classes em AngelScript sao tipos por valor (alocados na pilha ou dentro de
// outros objetos) e tambem podem ser usadas por referencia, com handles (@).

class Contador
{
    // Atributo privado: so os metodos da classe acessam.
    private int valor;
    private string rotulo;

    // Construtor. Pode haver mais de um, com assinaturas diferentes.
    Contador()
    {
        valor = 0;
        rotulo = "sem rotulo";
    }

    Contador(string r)
    {
        valor = 0;
        rotulo = r;
    }

    // Destrutor: chamado quando o objeto deixa de existir.
    ~Contador()
    {
        print("destruindo contador " + rotulo);
    }

    // Metodo que altera o estado.
    void incrementar()
    {
        valor++;
    }

    void incrementar(int passo)
    {
        valor += passo;
    }

    // Metodo const: promete nao modificar o objeto e pode ser chamado
    // em referencias const.
    int obterValor() const
    {
        return valor;
    }

    string obterRotulo() const
    {
        return rotulo;
    }

    // Propriedade com acesso get/set: o script usa "c.total" como se fosse
    // um atributo, mas os metodos sao chamados.
    int get_total() const property
    {
        return valor;
    }

    void set_total(int novo) property
    {
        if (novo < 0)
            valor = 0;
        else
            valor = novo;
    }
}

void main()
{
    // Objeto por valor: o destrutor roda ao sair do bloco.
    {
        Contador c("pedidos");
        c.incrementar();
        c.incrementar(5);
        print(c.obterRotulo() + " = " + c.obterValor());

        // Uso da propriedade.
        print("total pela propriedade: " + c.total);
        c.total = 100;
        print("apos set_total(100): " + c.total);
        c.total = -5;                     // o setter normaliza para 0
        print("apos set_total(-5): " + c.total);
    }

    // Objeto por handle: criado no heap e liberado quando a ultima
    // referencia desaparece.
    Contador@ h = Contador("temporario");
    h.incrementar(7);
    print("handle: " + h.obterRotulo() + " = " + h.total);

    // Handle nulo e comparavel com null.
    Contador@ vazio = null;
    if (vazio is null)
        print("handle nulo, nenhum objeto criado");

    // Duas referencias para o mesmo objeto compartilham o estado.
    Contador@ copia = h;
    copia.incrementar();
    print("mesmo objeto por duas referencias: " + h.total);
}
