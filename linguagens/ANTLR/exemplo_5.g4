// exemplo_5.g4 -- funcoes tipadas e comentarios em canal oculto
//
// Tema: regras fragment (nao geram token), comandos de canal
// (-> channel(HIDDEN)) e uma linguagem com funcoes tipadas.
// Entrada aceita, por exemplo:
//   funcao soma(a: inteiro, b: inteiro) : inteiro {
//       retorna a + b;
//   }
//
grammar exemplo_5;

programa        : funcao+ EOF ;
funcao          : 'funcao' IDENT '(' listaParametros? ')' ':' tipo bloco ;
listaParametros : parametro (',' parametro)* ;
parametro       : IDENT ':' tipo ;
tipo            : 'inteiro' | 'real' | 'logico' | 'texto' ;
bloco           : '{' comando* retorno? '}' ;
retorno         : 'retorna' expressao ';' ;
comando         : IDENT '=' expressao ';' | 'imprima' expressao ';' ;

expressao
    : chamada                              # invocacao
    | expressao ('*' | '/') expressao      # produto
    | expressao ('+' | '-') expressao      # soma
    | IDENT                                # variavel
    | NUMERO                               # numero
    | '(' expressao ')'                    # agrupamento
    ;

chamada : IDENT '(' (expressao (',' expressao)*)? ')' ;

// Fragmentos: usados apenas dentro de outras regras de lexer.
fragment LETRA  : [a-zA-Z_] ;
fragment DIGITO : [0-9] ;

IDENT  : LETRA (LETRA | DIGITO)* ;
NUMERO : DIGITO+ ('.' DIGITO+)? ;
// Comentarios vao para o canal HIDDEN: nao somem, mas nao chegam ao parser.
COMENTARIO_BLOCO : '/*' .*? '*/' -> channel(HIDDEN) ;
COMENTARIO_LINHA : '//' ~[\r\n]* -> channel(HIDDEN) ;
WS               : [ \t\r\n]+ -> skip ;
