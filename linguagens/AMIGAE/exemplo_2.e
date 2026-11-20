-> exemplo_2.e -- Variaveis, constantes e tipos
-> Em E toda variavel precisa ser declarada com DEF antes do uso.
-> Sem tipo explicito a variavel e um LONG (inteiro de 32 bits).
-> INT e CHAR nao podem ser usados como tipo de variavel escalar:
-> eles so valem como elemento de tipos compostos, como ARRAY OF INT.
-> CONST cria uma constante de compilacao (nao pode citar outra CONST).

CONST LIMITE=100
CONST NOME_PROGRAMA='exemplo_2'

PROC main()
  DEF idade, dobro, soma:LONG
  DEF nome[20]:STRING
  DEF notas[5]:ARRAY OF INT
  DEF i, total

  idade := 21
  dobro := idade * 2
  soma := dobro + LIMITE

  StrCopy(nome, 'Wouter')
  notas[0] := 7
  notas[1] := 9
  notas[2] := 8
  notas[3] := 10
  notas[4] := 6

  total := 0
  FOR i := 0 TO 4
    total := total + notas[i]
  ENDFOR

  WriteF('Programa: \s\n', NOME_PROGRAMA)
  WriteF('Nome: \s, idade: \d, dobro: \d\n', nome, idade, dobro)
  WriteF('Soma com a constante: \d\n', soma)
  WriteF('Total das \d notas: \d\n', 5, total)
ENDPROC
