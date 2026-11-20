// exercicio_2.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de uma calculadora com variaveis. Cada instrucao e uma
// atribuicao (guarda o resultado) ou uma expressao solta (imprime o valor).
// Aceita decimal e hexadecimal, potencia associativa a direita e resto.
// Entrada aceita, por exemplo:
//   area = 3.5 * 2 ^ 3;
//   mascara = 0xFF % 7;
//   area + mascara;
//
grammar exercicio_2;

sessao : instrucao+ EOF ;

instrucao
    : IDENT '=' expressao ';'   # atribuir
    | expressao ';'             # avaliar
    ;

expressao
    : <assoc=right> expressao '^' expressao     # potencia
    | '-' expressao                             # oposto
    | expressao ('*' | '/' | '%') expressao     # produto
    | expressao ('+' | '-') expressao           # soma
    | '(' expressao ')'                         # grupo
    | NUMERO                                    # numero
    | IDENT                                     # variavel
    ;

// Decimal primeiro; o hexadecimal vence por ser mais longo no lexer.
NUMERO : [0-9]+ ('.' [0-9]+)? | '0' [xX] [0-9a-fA-F]+ ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS     : [ \t\r\n]+ -> skip ;
