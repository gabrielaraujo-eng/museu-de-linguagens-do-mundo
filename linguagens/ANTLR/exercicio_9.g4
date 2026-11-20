// exercicio_9.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de um subconjunto da linguagem DOT (Graphviz), com grafo
// direcionado, nos, arestas e listas de atributos.
// Entrada aceita, por exemplo:
//   digraph museu { inicio -> antlr [label="primeiro"]; antlr [cor=azul]; }
// Observacao: validar se os nos citados nas arestas foram declarados exige
// um listener que guarde os nomes vistos; a gramatica so verifica a forma.
//
grammar exercicio_9;

grafo : 'digraph' IDENT? '{' elemento* '}' EOF ;

elemento
    : no ';'?
    | aresta ';'?
    ;

no        : IDENT atributos? ;
aresta    : origem=IDENT '->' destino=IDENT atributos? ;
atributos : '[' par (',' par)* ']' ;
par       : chave=IDENT '=' valor ;

valor : CADEIA | NUMERO | IDENT ;

IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
CADEIA : '"' ( '\\"' | ~["\r\n] )* '"' ;
NUMERO : '-'? [0-9]+ ('.' [0-9]+)? ;
COMENTARIO : ('//' | '#') ~[\r\n]* -> skip ;
WS     : [ \t\r\n]+ -> skip ;
