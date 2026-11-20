-> exercicio_10.e -- Ordenacao (selection sort decrescente)
-> ENUNCIADO: ordene um vetor de dez notas em ordem decrescente usando
-> selecao: a cada passagem, procure o maior elemento da parte nao
-> ordenada e troque-o com a posicao atual. Mostre o vetor antes e
-> depois e a maior e a menor nota.
-> SOLUCAO:

CONST N=10

DEF notas[N]:ARRAY OF INT

PROC mostrar(rotulo)
  DEF i
  WriteF('\s: ', rotulo)
  FOR i := 0 TO (N - 1)
    WriteF('\d ', notas[i])
  ENDFOR
  WriteF('\n')
ENDPROC

PROC preencher()
  DEF i, valores[N]:ARRAY OF INT
  valores[0] := 7
  valores[1] := 10
  valores[2] := 4
  valores[3] := 9
  valores[4] := 2
  valores[5] := 8
  valores[6] := 6
  valores[7] := 1
  valores[8] := 5
  valores[9] := 3
  FOR i := 0 TO (N - 1)
    notas[i] := valores[i]
  ENDFOR
ENDPROC

PROC ordenar_decrescente()
  DEF i, j, pos_maior, aux
  FOR i := 0 TO (N - 2)
    pos_maior := i
    FOR j := i + 1 TO (N - 1)
      IF notas[j] > notas[pos_maior]
        pos_maior := j
      ENDIF
    ENDFOR
    IF pos_maior <> i
      aux := notas[i]
      notas[i] := notas[pos_maior]
      notas[pos_maior] := aux
    ENDIF
  ENDFOR
ENDPROC

PROC main()
  preencher()
  mostrar('antes ')
  ordenar_decrescente()
  mostrar('depois')
  WriteF('maior nota: \d\n', notas[0])
  WriteF('menor nota: \d\n', notas[N - 1])
ENDPROC
