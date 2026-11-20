// exercicio_10.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de uma linguagem de programacao em miniatura (MiniAlgol),
// reunindo programa nomeado, secao de variaveis, vetores, atribuicao,
// condicional, laco, escrita, bloco composto e expressoes com precedencia.
// Entrada aceita, por exemplo:
//   programa media;
//   var n: inteiro; notas: real[10];
//   inicio
//     n := 0;
//     enquanto n < 10 faca n := n + 1;
//     escreva(notas[0])
//   fim.
//
grammar exercicio_10;

programa   : 'programa' IDENT ';' bloco '.' EOF ;
bloco      : declaracoes? comandos? ;
declaracoes: 'var' declaracao (';' declaracao)* ';' ;
declaracao : IDENT ':' tipo ('[' NUMERO ']')? ;
tipo       : 'inteiro' | 'real' | 'logico' ;
comandos   : comando (';' comando)* ;

comando
    : IDENT ':=' expressao                              # atribuicao
    | 'se' expressao 'entao' comando ('senao' comando)?  # condicional
    | 'enquanto' expressao 'faca' comando                # laco
    | 'escreva' '(' expressao ')'                        # escrita
    | 'inicio' comandos 'fim'                            # composto
    | 'vazio'                                            # nada
    ;

expressao
    : expressao ('*' | '/') expressao                          # produto
    | expressao ('+' | '-') expressao                          # soma
    | expressao ('<' | '<=' | '>' | '>=' | '=' | '<>') expressao  # relacao
    | 'nao' expressao                                          # negacao
    | IDENT '[' expressao ']'                                  # acessoVetor
    | IDENT                                                    # variavel
    | NUMERO                                                   # numero
    | 'verdadeiro'                                             # verdadeiro
    | 'falso'                                                  # falso
    | '(' expressao ')'                                        # agrupamento
    ;

NUMERO : [0-9]+ ('.' [0-9]+)? ;
IDENT  : [a-zA-Z_] [a-zA-Z_0-9]* ;
WS     : [ \t\r\n]+ -> skip ;
