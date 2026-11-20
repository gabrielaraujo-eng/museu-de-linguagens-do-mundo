// exemplo_10.as - tratamento de excecoes com try / catch
//
// AngelScript nao tem instrucao throw: as excecoes vem de erros de execucao
// (divisao por zero, acesso a handle nulo, indice invalido) ou de funcoes
// registradas pela aplicacao hospedeira. O bloco catch nao declara variavel:
// ele apenas recupera o controle. Sem try/catch, a execucao do script e
// interrompida e o erro e reportado ao hospedeiro.

class Caixa
{
    int conteudo;
    Caixa(int v) { conteudo = v; }
    int obter() const { return conteudo; }
}

// Funcao que valida antes de dividir e sinaliza o problema por um codigo.
bool dividirSeguro(int a, int b, int &out resultado)
{
    if (b == 0)
        return false;
    resultado = a / b;
    return true;
}

void main()
{
    // 1) Divisao por zero: erro de execucao capturado pelo catch.
    try
    {
        int zero = 0;
        int resultado = 10 / zero;
        print("esta linha nao executa: " + resultado);
    }
    catch
    {
        print("excecao capturada: divisao por zero");
    }

    // 2) Acesso a metodo de handle nulo. O tipo string do add-on nao
    //    aceita handles; por isso o exemplo usa uma classe.
    Caixa@ caixa = null;
    try
    {
        print("conteudo: " + caixa.obter());
    }
    catch
    {
        print("excecao capturada: handle nulo");
    }

    // 3) Indice fora dos limites de um array.
    array<int> dados = {1, 2, 3};
    try
    {
        print("elemento 10: " + dados[10]);
    }
    catch
    {
        print("excecao capturada: indice fora dos limites");
    }

    // 4) A execucao continua normalmente depois do bloco.
    int valor;
    if (dividirSeguro(9, 3, valor))
        print("9 / 3 = " + valor);
    else
        print("divisao recusada");

    if (!dividirSeguro(9, 0, valor))
        print("divisao por zero recusada antes de executar");

    // 5) try/catch aninhado: o catch interno trata, o externo nao e acionado.
    try
    {
        try
        {
            int zero = 0;
            int x = 1 / zero;
        }
        catch
        {
            print("tratado no catch interno");
        }
        print("o fluxo seguiu depois do catch interno");
    }
    catch
    {
        print("este catch externo nao e executado");
    }
}
