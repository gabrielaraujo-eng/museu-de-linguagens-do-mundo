// exercicio_10.as - divisao segura com try/catch e continuacao do fluxo
//
// Tarefa: dividir cada elemento de um array pelo anterior, sobrevivendo a
// divisor zero, a indice invalido e a handle nulo; ao final, mostrar quantos
// casos deram certo e quantos geraram excecao.

class Medidor
{
    private double escala;

    Medidor(double e) { escala = e; }
    double converter(double v) const { return v * escala; }
}

void main()
{
    array<int> valores = {10, 2, 0, 5, 4};
    int sucessos = 0;
    int excecoes = 0;

    for (uint i = 1; i < valores.length(); i++)
    {
        try
        {
            int resultado = valores[i - 1] / valores[i];
            print("" + valores[i - 1] + " / " + valores[i] + " = " + resultado);
            sucessos++;
        }
        catch
        {
            print("" + valores[i - 1] + " / " + valores[i] + " falhou: divisor zero");
            excecoes++;
        }
    }

    // Indice fora dos limites dentro de try: o catch devolve o controle.
    try
    {
        print("valores[99] = " + valores[99]);
    }
    catch
    {
        print("acesso a indice 99 recusado");
        excecoes++;
    }

    // Handle nulo com try/catch.
    Medidor@ m = null;
    try
    {
        print("conversao: " + m.converter(2.0));
    }
    catch
    {
        print("medidor nulo: conversao recusada");
        excecoes++;
    }

    // Depois das excecoes, um objeto valido continua sendo usado normalmente.
    Medidor@ valido = Medidor(2.5);
    print("medidor valido: " + valido.converter(4.0));

    // Bloco aninhado: o catch interno trata e o externo nao dispara.
    try
    {
        try
        {
            int zero = 0;
            int x = 1 / zero;
        }
        catch
        {
            print("tratado internamente");
        }
        print("fluxo retomado apos o catch interno");
    }
    catch
    {
        print("catch externo nao deveria executar");
    }

    print("resumo: " + sucessos + " divisoes ok, " + excecoes + " excecoes tratadas");
}
