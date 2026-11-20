// exercicio_3.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de condicoes booleanas com negacao, conjuncao,
// disjuncao e comparacoes, respeitando a precedencia usual
// (negacao > comparacao > conjuncao > disjuncao).
// Entrada aceita, por exemplo:
//   !(idade >= 18) || (renda > 2000 && ativo)
//
grammar exercicio_3;

condicao : expressao EOF ;

expressao
    : '!' expressao                                        # negacao
    | expressao ('==' | '!=' | '<' | '<=' | '>' | '>=') expressao  # comparacao
    | expressao '&&' expressao                             # conjuncao
    | expressao '||' expressao                             # disjuncao
    | 'verdadeiro'                                         # verdadeiro
    | 'falso'                                              # falso
    | IDENT                                                # referencia
    | NUMERO                                               # numero
    | '(' expressao ')'                                    # agrupamento
    ;

NUMERO : [0-9]+ ('.' [0-9]+)? ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS     : [ \t\r\n]+ -> skip ;
