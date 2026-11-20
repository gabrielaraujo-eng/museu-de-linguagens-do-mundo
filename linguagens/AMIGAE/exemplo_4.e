-> exemplo_4.e -- Repeticoes: FOR/ENDFOR, STEP, WHILE e REPEAT/UNTIL
-> FOR i:=a TO b percorre o intervalo inclusive; STEP -1 conta para tras.
-> WHILE testa a condicao antes do corpo; REPEAT testa depois (executa
-> o corpo pelo menos uma vez). EXIT abandona o laco imediatamente.

PROC main()
  DEF i, soma, n

  WriteF('Contagem crescente:\n')
  FOR i := 1 TO 5
    WriteF('\d ', i)
  ENDFOR
  WriteF('\n')

  WriteF('Contagem regressiva:\n')
  FOR i := 5 TO 1 STEP -1
    WriteF('\d ', i)
  ENDFOR
  WriteF('\n')

  soma := 0
  i := 1
  WHILE i <= 10
    soma := soma + i
    i := i + 1
  ENDWHILE
  WriteF('Soma de 1 a 10 com WHILE: \d\n', soma)

  n := 0
  REPEAT
    n := n + 3
  UNTIL n >= 12
  WriteF('Primeiro multiplo de 3 maior ou igual a 12: \d\n', n)

  WriteF('Procurando o primeiro divisor de 91 acima de 1: ')
  FOR i := 2 TO 91
    IF (Mod(91, i)) = 0
      WriteF('\d\n', i)
      EXIT
    ENDIF
  ENDFOR
ENDPROC
