// exemplo_7.g4 -- tolerancia a erros
//
// Tema: blocos @header e @parser::members, acoes embutidas e um token
// coringa que impede que uma linha desconhecida derrube a analise.
// Entrada aceita, por exemplo:
//   x = 10;
//   @@@
//   imprima x;
//
grammar exemplo_7;

@header {
// Trecho copiado para o inicio do codigo gerado (aqui, apenas um comentario).
}

@parser::members {
    // Contador de problemas registrados pela propria gramatica.
    private int problemas = 0;

    public int getProblemas() {
        return problemas;
    }

    public void registrar(Token t, String mensagem) {
        problemas++;
        System.err.println("linha " + t.getLine() + ": " + mensagem
                           + " -> '" + t.getText() + "'");
    }
}

programa   : comando* EOF ;
comando
    : atribuicao
    | impressao
    | invalido
    ;
atribuicao : IDENT '=' NUMERO ';' ;
impressao  : 'imprima' (IDENT | NUMERO) ';' ;

// A acao roda ao reconhecer o token coringa: erro contabilizado, analise segue.
invalido   : DESCONHECIDO+ ';'?
             { registrar($DESCONHECIDO, "comando nao reconhecido"); }
           ;

IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
NUMERO : [0-9]+ ;
WS     : [ \t\r\n]+ -> skip ;
// Deve ser a ultima regra de lexer: casa qualquer caractere nao tratado acima.
DESCONHECIDO : . ;
