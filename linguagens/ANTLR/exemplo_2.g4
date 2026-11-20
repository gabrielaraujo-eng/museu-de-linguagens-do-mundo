// exemplo_2.g4 -- expressoes aritmeticas
//
// Tema: recursao a esquerda, precedencia pela ordem das alternativas,
// associatividade a direita e rotulos de alternativa (# nome).
// Entradas aceitas, por exemplo:  2 + 3 * 4 ^ 2      -(a - b) / 2
//
grammar exemplo_2;

programa : expressao EOF ;

// A ordem das alternativas define a precedencia: a primeira liga mais forte.
// <assoc=right> vale apenas para a referencia recursiva mais a esquerda.
expressao
    : <assoc=right> base=expressao '^' expoente=expressao        # potencia
    | sinal='-' operando=expressao                               # negacao
    | esquerda=expressao operador=('*' | '/') direita=expressao   # multiplicacao
    | esquerda=expressao operador=('+' | '-') direita=expressao   # adicao
    | '(' expressao ')'                                          # parenteses
    | NUMERO                                                     # numero
    | IDENT                                                      # variavel
    ;

NUMERO : [0-9]+ ('.' [0-9]+)? ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS     : [ \t\r\n]+ -> skip ;
