// exercicio_5.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de um arquivo de configuracao no formato INI, com
// secoes entre colchetes, pares chave=valor e comentarios com ';' ou '#'.
// Entrada aceita, por exemplo:
//   [banco]
//   host = localhost
//   porta = 5432
//   nome = "museu"
//   ; comentario ignorado
//
grammar exercicio_5;

arquivo : secao* EOF ;
secao   : '[' IDENT ']' entrada* ;
entrada : chave=IDENT '=' valor ;

valor : CADEIA | NUMERO | IDENT ;

CADEIA     : '"' ~["\r\n]* '"' ;
NUMERO     : '-'? [0-9]+ ('.' [0-9]+)? ;
IDENT      : [a-zA-Z_] [a-zA-Z_0-9.-]* ;
COMENTARIO : (';' | '#') ~[\r\n]* -> skip ;
WS         : [ \t\r\n]+ -> skip ;
