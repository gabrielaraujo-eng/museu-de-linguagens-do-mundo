// exemplo_1.as - estrutura minima de um script AngelScript
//
// AngelScript nao tem funcao de entrada obrigatoria: quem executa o script
// (a aplicacao hospedeira, escrita em C++) procura uma funcao global e a chama.
// A convencao usada pelo sample "console" do SDK oficial e "void main()".
//
// A funcao print() tambem nao faz parte do nucleo da linguagem: ela e
// registrada pela aplicacao hospedeira e recebe um unico parametro string.

// Comentario de uma linha, igual a C++.
/* Comentario de bloco,
   tambem igual a C++. */

void main()
{
    // Uma instrucao por linha, terminada em ponto e virgula.
    print("Ola, mundo!");

    // Chamadas sucessivas produzem uma linha de saida cada.
    print("Este script foi compilado e executado pelo hospedeiro AngelScript.");

    // return sem expressao encerra uma funcao void antecipadamente.
    return;
}
