// exercicio_8.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de expressoes regulares na sintaxe de PCRE/POSIX, com
// alternancia, grupos, classes de caracteres, curinga, ancoras e
// quantificadores (* + ? {n} {n,} {n,m}).
// Entradas aceitas, por exemplo:
//   ^(ab|c[0-9]+)*\.txt$
//   [A-Z][a-z]{2,4}
// Espacos em branco sao ignorados (modo estendido), por isso use \  para
// representar um espaco literal.
//
grammar exercicio_8;

regex : alternancia? EOF ;

alternancia  : concatenacao ('|' concatenacao)* ;
concatenacao : repeticao+ ;
repeticao    : atomo quantificador? ;

quantificador
    : '*'                              # estrela
    | '+'                              # mais
    | '?'                              # opcional
    | '{' NUMERO (',' NUMERO?)? '}'    # contagem
    ;

atomo
    : '(' alternancia ')'   # grupo
    | '[' classe ']'        # conjunto
    | '.'                   # curinga
    | '^'                   # ancoraInicio
    | '$'                   # ancoraFim
    | ESCAPE                # escape
    | CARACTERE             # literal
    ;

classe     : '^'? itemClasse+ ;
itemClasse : CARACTERE ('-' CARACTERE)? | ESCAPE ;

CARACTERE : ~[\\|()*+?.^$[\]{} \t\r\n] ;
ESCAPE    : '\\' . ;
NUMERO    : [0-9]+ ;
WS        : [ \t\r\n]+ -> skip ;
