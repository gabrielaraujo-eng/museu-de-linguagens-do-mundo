// exercicio_7.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de um subconjunto de SQL de leitura (SELECT ... FROM ...
// WHERE ... ORDER BY), com aliases, comparacoes, AND/OR/NOT e parenteses.
// As palavras-chave sao reconhecidas em maiusculas.
// Entrada aceita, por exemplo:
//   SELECT nome AS n, idade FROM pessoas
//   WHERE idade >= 18 AND (cidade = 'Recife' OR cidade = 'Olinda')
//   ORDER BY idade DESC;
//
grammar exercicio_7;

consulta
    : 'SELECT' selecao 'FROM' tabela
      ('WHERE' condicao)?
      ('ORDER' 'BY' ordenacao (',' ordenacao)*)?
      ';'? EOF
    ;

selecao : '*' | item (',' item)* ;
item    : coluna ('AS' IDENT)? ;
coluna  : IDENT ('.' IDENT)? ;
tabela  : IDENT ;

condicao
    : 'NOT' condicao                              # negacao
    | condicao 'AND' condicao                     # conjuncao
    | condicao 'OR' condicao                      # disjuncao
    | coluna op=('=' | '<>' | '<' | '>' | '<=' | '>=') valor  # comparacao
    | '(' condicao ')'                            # agrupamento
    ;

valor     : NUMERO | CADEIA | IDENT ;
ordenacao : coluna ('ASC' | 'DESC')? ;

IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
CADEIA : '\'' ( '\'\'' | ~['\r\n] )* '\'' ;
NUMERO : [0-9]+ ('.' [0-9]+)? ;
WS     : [ \t\r\n]+ -> skip ;
