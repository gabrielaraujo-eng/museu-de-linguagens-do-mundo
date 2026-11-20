-> exemplo_10.e -- Algoritmo: ordenacao por trocas (bubble sort)
-> O vetor e global (ARRAY OF INT) para poder ser usado por varios
-> procedimentos. O procedimento troca() recebe os indices e permuta
-> os valores; mostrar() imprime o vetor em uma linha.

CONST TAM=8

DEF vetor[TAM]:ARRAY OF INT

PROC preencher()
  DEF i
  FOR i := 0 TO (TAM - 1)
    vetor[i] := (TAM - i) * 3
  ENDFOR
ENDPROC

PROC mostrar(rotulo)
  DEF i
  WriteF('\s: ', rotulo)
  FOR i := 0 TO (TAM - 1)
    WriteF('\d ', vetor[i])
  ENDFOR
  WriteF('\n')
ENDPROC

PROC troca(x, y)
  DEF aux
  aux := vetor[x]
  vetor[x] := vetor[y]
  vetor[y] := aux
ENDPROC

PROC ordenar()
  DEF i, j, houve_troca
  FOR i := 0 TO (TAM - 2)
    houve_troca := FALSE
    FOR j := 0 TO (TAM - 2 - i)
      IF vetor[j] > vetor[j + 1]
        troca(j, j + 1)
        houve_troca := TRUE
      ENDIF
    ENDFOR
    IF houve_troca = FALSE
      WriteF('vetor ja ordenado na passagem \d\n', i + 1)
      EXIT
    ENDIF
  ENDFOR
ENDPROC

PROC main()
  preencher()
  mostrar('antes ')
  ordenar()
  mostrar('depois')
ENDPROC
