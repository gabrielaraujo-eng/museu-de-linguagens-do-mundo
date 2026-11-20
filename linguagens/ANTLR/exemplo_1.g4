// exemplo_1.g4 -- anatomia de uma gramatica ANTLR 4
//
// Tema: estrutura minima de uma gramatica combinada (parser + lexer),
// nomes de regras, literais e descarte de espacos em branco.
// Entrada aceita, por exemplo:  ola mundo;
//
grammar exemplo_1;

// ---------- Regras de parser: nomes comecam em minuscula ----------
// O EOF no fim obriga o parser a consumir a entrada inteira.
saudacao : 'ola' nome=IDENT ';' EOF ;

// ---------- Regras de lexer: nomes comecam em MAIUSCULA ----------
IDENT      : [a-zA-Z_] [a-zA-Z_0-9]* ;
COMENTARIO : '//' ~[\r\n]* -> skip ;
WS         : [ \t\r\n]+ -> skip ;
