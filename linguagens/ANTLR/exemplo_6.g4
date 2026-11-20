// exemplo_6.g4 -- JSON (RFC 8259)
//
// Tema: recursao real, fragmentos encadeados e tratamento completo de
// escapes de cadeia. Entrada aceita, por exemplo:
//   {"nome": "Museu", "aberto": true, "salas": [1, 2, {"anexo": null}]}
//
grammar exemplo_6;

json  : valor EOF ;

valor
    : objeto
    | vetor
    | CADEIA
    | NUMERO
    | 'true'
    | 'false'
    | 'null'
    ;

objeto : '{' (par (',' par)*)? '}' ;
par    : chave=CADEIA ':' valor ;
vetor  : '[' (valor (',' valor)*)? ']' ;

// Cadeia JSON: aspas duplas, sem caracteres de controle crus, com escapes.
CADEIA  : '"' ( ESCAPE | ~["\\\u0000-\u001F] )* '"' ;
fragment ESCAPE  : '\\' ( ["\\/bfnrt] | UNICODE ) ;
fragment UNICODE : 'u' HEX HEX HEX HEX ;
fragment HEX     : [0-9a-fA-F] ;

// Numero JSON nao aceita '+', zeros a esquerda nem ponto solto.
NUMERO : '-'? ( '0' | [1-9] [0-9]* ) ( '.' [0-9]+ )? ( [eE] [+-]? [0-9]+ )? ;

WS : [ \t\r\n]+ -> skip ;
