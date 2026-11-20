// exercicio_6.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: gramatica de expressoes com operadores bit a bit e literais em
// quatro bases. Precedencia: deslocamento > E bit a bit > OU exclusivo > OU.
// Entrada aceita, por exemplo:
//   (0xFF & 0b1010) | (0o17 << 2) ^ ~7
//
grammar exercicio_6;

expressao : expr EOF ;

expr
    : expr ('<<' | '>>') expr   # deslocamento
    | expr '&' expr             # eBit
    | expr '^' expr             # ouExclusivo
    | expr '|' expr             # ouBit
    | '~' expr                  # complemento
    | '-' expr                  # menosUnario
    | '(' expr ')'              # agrupamento
    | HEXADECIMAL               # hexadecimal
    | BINARIO                   # binario
    | OCTAL                     # octal
    | DECIMAL                   # decimal
    ;

HEXADECIMAL : '0' [xX] [0-9a-fA-F]+ ;
BINARIO     : '0' [bB] [01]+ ;
OCTAL       : '0' [oO] [0-7]+ ;
DECIMAL     : [0-9]+ ;
WS          : [ \t\r\n]+ -> skip ;
