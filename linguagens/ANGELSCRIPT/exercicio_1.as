// exercicio_1.as - saida em varias linhas a partir de constantes de texto
//
// Tarefa: exibir um cabecalho de tres linhas usando variaveis string,
// concatenacao com + e a funcao print() registrada pelo hospedeiro.

void main()
{
    const string PROGRAMA = "Museu de Linguagens do Mundo";
    string linguagem = "AngelScript";
    int ano = 2003;

    print(PROGRAMA);
    print("Linguagem: " + linguagem);
    print("Criada em " + ano + " por Andreas Jonsson");

    // Duas linhas extras montadas a partir de variaveis locais.
    string autor = "Andreas Jonsson";
    string ficha = linguagem + " / " + autor + " / " + ano;
    print("Ficha: " + ficha);
    print("Caracteres no nome da linguagem: " + linguagem.length());
}
