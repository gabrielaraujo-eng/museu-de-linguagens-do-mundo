-> exercicio_5.e -- Funcoes e recursao
-> ENUNCIADO: escreva uma funcao potencia(base, expoente) que calcule
-> base elevada ao expoente por multiplicacoes sucessivas (recursao ou
-> laco) e mostre 2^10, 3^4 e 5^0. Use ENDPROC com valor de retorno.
-> SOLUCAO:

PROC potencia(base, expoente)
  DEF resultado, i
  resultado := 1
  FOR i := 1 TO expoente
    resultado := resultado * base
  ENDFOR
ENDPROC resultado

PROC potencia_rec(base, expoente)
  DEF resultado
  IF expoente = 0
    resultado := 1
  ELSE
    resultado := base * potencia_rec(base, expoente - 1)
  ENDIF
ENDPROC resultado

PROC main()
  WriteF('2 elevado a 10 = \d\n', potencia(2, 10))
  WriteF('3 elevado a 4  = \d\n', potencia(3, 4))
  WriteF('5 elevado a 0  = \d\n', potencia(5, 0))
  WriteF('recursivo 2^10 = \d\n', potencia_rec(2, 10))
ENDPROC
