// exemplo_10.g4 -- linguagem de algoritmos com vetores
//
// Tema: algoritmo completo com vetor, laco "para ... de ... ate ... faca",
// troca de posicoes e expressoes com indexacao.
// Entrada aceita, por exemplo:
//   algoritmo bolha() {
//       vetor v[5];
//       para i de 0 ate 4 faca v[i] = 4 - i;
//   }
//
grammar exemplo_10;

algoritmo : 'algoritmo' IDENT '(' ')' bloco ;
bloco     : '{' declaracao* comando* '}' ;

declaracao
    : 'vetor' IDENT '[' NUMERO ']' ';'   # vetorInteiro
    | 'inteiro' IDENT ';'                 # escalarInteiro
    ;

comando
    : IDENT '[' expressao ']' '=' expressao ';'                       # guardarIndice
    | IDENT '=' expressao ';'                                          # guardarEscalar
    | 'para' IDENT 'de' expressao 'ate' expressao 'faca' comando       # lacoPara
    | 'se' '(' expressao ')' comando ('senao' comando)?                # condicional
    | 'troque' IDENT '[' expressao ']' 'com' IDENT '[' expressao ']' ';'  # troca
    | 'imprima' expressao ';'                                          # escrita
    | bloco                                                            # aninhado
    ;

expressao
    : expressao ('*' | '/') expressao                                  # produto
    | expressao ('+' | '-') expressao                                  # soma
    | expressao ('<' | '<=' | '>' | '>=' | '==' | '!=') expressao      # relacao
    | IDENT '[' expressao ']'                                          # acessoVetor
    | IDENT                                                            # variavel
    | NUMERO                                                           # numero
    | '(' expressao ')'                                                # agrupamento
    ;

NUMERO : [0-9]+ ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
COMENTARIO : '//' ~[\r\n]* -> skip ;
WS     : [ \t\r\n]+ -> skip ;
