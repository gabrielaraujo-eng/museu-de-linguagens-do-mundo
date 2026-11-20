// exercicio_1.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: escrever a gramatica de uma linha de comando, com o nome do
// programa, opcoes curtas (-v), opcoes longas (--saida=arquivo.txt) e
// uma lista de argumentos. As opcoes vem antes dos argumentos.
// Entrada aceita, por exemplo:
//   converte --verbose --saida=relatorio.txt -f entrada.csv saida.csv
//
grammar exercicio_1;

linhaDeComando : programa=ARGUMENTO opcao* argumento+ EOF ;

opcao
    : '--' nome=ARGUMENTO ('=' valor=ARGUMENTO)?   # opcaoLonga
    | '-' letra=ARGUMENTO                          # opcaoCurta
    ;

argumento : ARGUMENTO ;

// Nome de programa, de opcao ou de arquivo: pode conter ponto, mas nunca
// comeca com hifen (senao engoliria as proprias opcoes da linha).
ARGUMENTO : [a-zA-Z0-9_.] [a-zA-Z0-9._]* ;
WS        : [ \t\r\n]+ -> skip ;
