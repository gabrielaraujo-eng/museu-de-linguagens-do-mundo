-> exemplo_6.e -- E-lists: listas com tipo, acessiveis por indice
-> Uma lista imediata [1, 2, 3] recebe o tipo depois dos dois pontos.
-> Ela e estatica: a mesma area e reaproveitada a cada avaliacao da
-> expressao, e por isso seus valores sao recarregados quando a linha
-> e executada de novo. Listas maiores podem ser alocadas no heap com
-> New() e devem ser liberadas com END.

PROC main()
  DEF fixa:PTR TO LONG
  DEF calculada:PTR TO LONG
  DEF i, soma

  fixa := [10, 20, 30, 40, 50]:LONG
  soma := 0
  FOR i := 0 TO 4
    soma := soma + fixa[i]
  ENDFOR
  WriteF('Lista imediata: \d elementos, soma \d\n', 5, soma)
  WriteF('Primeiro: \d, ultimo: \d\n', fixa[0], fixa[4])

  calculada := [0, 0, 0, 0]:LONG
  FOR i := 0 TO 3
    calculada[i] := (i + 1) * (i + 1)
  ENDFOR
  FOR i := 0 TO 3
    WriteF('quadrado de \d = \d\n', i + 1, calculada[i])
  ENDFOR

  END fixa
  END calculada
  WriteF('As duas listas foram liberadas com END.\n')
ENDPROC
