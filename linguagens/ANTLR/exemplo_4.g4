// exemplo_4.g4 -- arquivo CSV
//
// Tema: operadores de repeticao ( * , + , ? ) e alternativa vazia.
// Entrada aceita, por exemplo:
//   nome,idade
//   "Ana Paula",34
//   "Linha ""citada""",7
//
grammar exemplo_4;

// Cada registro exige o fim de linha; a ultima linha pode vir sem '\n'.
arquivo     : cabecalho? registro* ultimaLinha? EOF ;
cabecalho   : linha FIM_LINHA ;
registro    : linha FIM_LINHA ;
ultimaLinha : campoNaoVazio (',' campo)* ;
linha       : campo (',' campo)* ;
// Alternativa vazia: aceita campo sem conteudo, como em "a,,c".
campo       : TEXTO | NUMERO | SEM_ASPAS | ;
// Usada na ultima linha para que ela nao possa casar com a entrada vazia.
campoNaoVazio : TEXTO | NUMERO | SEM_ASPAS ;

FIM_LINHA : '\r'? '\n' ;
TEXTO     : '"' ( '""' | ~["\r\n] )* '"' ;
NUMERO    : '-'? [0-9]+ ('.' [0-9]+)? ;
// Campo sem aspas: qualquer trecho sem virgula, aspas ou espaco.
SEM_ASPAS : ~[,"\r\n \t]+ ;
WS        : [ \t]+ -> skip ;
