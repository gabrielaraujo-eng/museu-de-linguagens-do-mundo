// exemplo_8.g4 -- manipulacao de cadeias de caracteres
//
// Tema: literais de cadeia com escapes, concatenacao, funcoes de texto e
// rotulos de alternativa. Entrada aceita, por exemplo:
//   nome = "Museu\nde Linguagens";
//   imprima maiusculo(nome) + " - " + tamanho(nome);
//
grammar exemplo_8;

programa : instrucao+ EOF ;

instrucao
    : 'imprima' texto ';'        # imprimir
    | IDENT '=' texto ';'        # guardar
    ;

texto
    : texto '+' texto               # concatenacao
    | 'tamanho' '(' texto ')'       # comprimento
    | 'maiusculo' '(' texto ')'     # maiusculas
    | 'minusculo' '(' texto ')'     # minusculas
    | CADEIA                        # literal
    | IDENT                         # referencia
    | '(' texto ')'                 # agrupamento
    ;

// Cadeia com escapes: \" \\ \/ \b \f \n \r \t e \uXXXX.
CADEIA : '"' ( ESCAPE | ~["\\\r\n] )* '"' ;

fragment ESCAPE : '\\' ( ["\\/bfnrt] | 'u' HEX HEX HEX HEX ) ;
fragment HEX    : [0-9a-fA-F] ;

IDENT : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS    : [ \t\r\n]+ -> skip ;
