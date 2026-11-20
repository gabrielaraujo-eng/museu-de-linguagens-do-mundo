// exemplo_3.g4 -- mini linguagem de comandos
//
// Tema: alternativas, regras que se referenciam em cadeia e estruturas de
// controle (declaracao, atribuicao, se/senao, enquanto, bloco entre chaves).
// Entrada aceita, por exemplo:
//   inteiro x = 0;
//   enquanto (x < 10) { x = x + 1; }
//
grammar exemplo_3;

programa : comando* EOF ;

comando
    : declaracao
    | atribuicao
    | selecao
    | repeticao
    | bloco
    ;

declaracao : tipo IDENT ('=' expressao)? ';' ;
tipo       : 'inteiro' | 'real' | 'logico' ;
atribuicao : IDENT '=' expressao ';' ;
selecao    : 'se' '(' expressao ')' comando ('senao' comando)? ;
repeticao  : 'enquanto' '(' expressao ')' comando ;
bloco      : '{' comando* '}' ;

expressao
    : expressao ('*' | '/') expressao                 # produto
    | expressao ('+' | '-') expressao                 # soma
    | expressao ('<' | '>' | '==' | '!=') expressao   # comparacao
    | 'nao' expressao                                 # negacao
    | IDENT                                           # variavel
    | NUMERO                                          # numero
    | 'verdadeiro'                                    # verdadeiro
    | 'falso'                                         # falso
    | '(' expressao ')'                               # agrupamento
    ;

NUMERO : [0-9]+ ('.' [0-9]+)? ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS     : [ \t\r\n]+ -> skip ;
