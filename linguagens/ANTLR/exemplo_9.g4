// exemplo_9.g4 -- expressoes matematicas
//
// Tema: fatorial posfixo, potencia associativa a direita, funcoes
// trigonometricas, constantes e notacao cientifica.
// Entradas aceitas, por exemplo:  5! + 2^10      sen(pi / 6) + 1.5e-3
//
grammar exemplo_9;

expressao : expr EOF ;

expr
    : <assoc=right> base=expr '^' expoente=expr        # potencia
    | expr '!'                                          # fatorial
    | expr operador=('*' | '/' | '%') expr              # produto
    | expr operador=('+' | '-') expr                    # soma
    | funcao                                            # aplicacao
    | CONSTANTE                                         # constante
    | NUMERO                                            # numero
    | '(' expr ')'                                      # agrupamento
    ;

funcao : nome=FUNCAO '(' (expr (',' expr)*)? ')' ;

FUNCAO    : 'sen' | 'cos' | 'tan' | 'log' | 'ln' | 'raiz' | 'abs' ;
CONSTANTE : 'pi' | 'e' ;
// Aceita 12, 12.5, .5 e 1.5e-3 (com ponto decimal).
NUMERO    : ( [0-9]+ ('.' [0-9]*)? | '.' [0-9]+ ) ( [eE] [+-]? [0-9]+ )? ;
WS        : [ \t\r\n]+ -> skip ;
