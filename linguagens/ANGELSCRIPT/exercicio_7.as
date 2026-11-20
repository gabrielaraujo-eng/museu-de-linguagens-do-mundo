// exercicio_7.as - classe ContaBancaria com construtor, metodos e propriedade
//
// Tarefa: modelar uma conta com saldo privado, metodos depositar/sacar que
// validam o valor e uma propriedade somente leitura para consultar o saldo.

class ContaBancaria
{
    private string nomeTitular;
    private double saldoAtual;
    private int numOperacoes;

    ContaBancaria(const string &in nome, double inicial)
    {
        nomeTitular = nome;
        saldoAtual = (inicial > 0.0) ? inicial : 0.0;
        numOperacoes = 0;
    }

    ~ContaBancaria()
    {
        print("encerrando conta de " + nomeTitular);
    }

    bool depositar(double valor)
    {
        if (valor <= 0.0)
            return false;
        saldoAtual += valor;
        numOperacoes++;
        return true;
    }

    bool sacar(double valor)
    {
        if (valor <= 0.0 || valor > saldoAtual)
            return false;
        saldoAtual -= valor;
        numOperacoes++;
        return true;
    }

    // Transferencia entre duas contas: recebe o destino por handle.
    bool transferir(ContaBancaria@ destino, double valor)
    {
        if (destino is null)
            return false;
        if (!sacar(valor))
            return false;
        destino.depositar(valor);
        return true;
    }

    // Propriedade somente leitura: nao ha set_saldo, entao a atribuicao
    // direta em conta.saldo nao compila.
    double get_saldo() const property
    {
        return saldoAtual;
    }

    string get_titular() const property
    {
        return nomeTitular;
    }

    int get_operacoes() const property
    {
        return numOperacoes;
    }
}

void main()
{
    ContaBancaria ana("Ana", 100.0);
    ContaBancaria bruno("Bruno", 50.0);

    print(ana.titular + " comeca com " + ana.saldo);
    print(bruno.titular + " comeca com " + bruno.saldo);

    print("deposito de 250: " + ana.depositar(250.0));
    print("saque de 400: " + ana.sacar(400.0) + " (saldo insuficiente)");
    print("saque de 50: " + ana.sacar(50.0));

    print("transferencia de 120 de Ana para Bruno: " + ana.transferir(bruno, 120.0));
    print("Ana: " + ana.saldo + " / Bruno: " + bruno.saldo);

    // Valor invalido e recusado pelo metodo.
    print("deposito de -10: " + ana.depositar(-10.0));

    // Handle nulo como destino.
    ContaBancaria@ nula = null;
    print("transferencia para conta nula: " + ana.transferir(nula, 10.0));

    print("operacoes de Ana: " + ana.operacoes);
    print("operacoes de Bruno: " + bruno.operacoes);

    // Os destrutores rodam ao final do bloco main, na ordem inversa.
}
