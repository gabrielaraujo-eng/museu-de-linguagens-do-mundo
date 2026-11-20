-> exercicio_3.e -- Condicoes
-> ENUNCIADO: dada uma nota inteira de 0 a 10, informe se o aluno foi
-> aprovado (nota >= 7), esta em recuperacao (5 a 6) ou reprovado
-> (abaixo de 5). Depois classifique a mesma nota em conceito A, B ou C
-> usando SELECT/CASE com intervalos TO.
-> SOLUCAO:

PROC situacao(nota)
  IF nota >= 7
    WriteF('nota \d: aprovado\n', nota)
  ELSEIF nota >= 5
    WriteF('nota \d: recuperacao\n', nota)
  ELSE
    WriteF('nota \d: reprovado\n', nota)
  ENDIF
ENDPROC

PROC main()
  DEF nota

  nota := 6
  situacao(nota)
  situacao(9)
  situacao(3)

  SELECT 4 OF nota
  CASE 0 TO 4
    WriteF('conceito C\n')
  CASE 5 TO 6
    WriteF('conceito B\n')
  CASE 7 TO 10
    WriteF('conceito A\n')
  DEFAULT
    WriteF('nota fora da faixa\n')
  ENDSELECT
ENDPROC
