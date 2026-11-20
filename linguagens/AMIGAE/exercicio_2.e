-> exercicio_2.e -- Variaveis e tipos legais
-> ENUNCIADO: converta 30 graus Celsius para Fahrenheit com a formula
-> F = (C * 9) / 5 + 32. Declare as variaveis com DEF (LONG implicito),
-> lembre que E nao tem precedencia de operadores e use parenteses.
-> Mostre a temperatura em Celsius e em Fahrenheit.
-> SOLUCAO:

PROC main()
  DEF celsius, fahrenheit

  celsius := 30
  fahrenheit := ((celsius * 9) / 5) + 32

  WriteF('Celsius....: \d\n', celsius)
  WriteF('Fahrenheit.: \d\n', fahrenheit)
  WriteF('Formula....: F = (C * 9) / 5 + 32\n')
ENDPROC
