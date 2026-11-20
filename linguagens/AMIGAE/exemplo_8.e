-> exemplo_8.e -- Strings de tamanho fixo (tipo STRING)
-> STRING e um vetor de CHAR com tamanho definido na declaracao.
-> StrCopy copia texto para dentro dela e EstrLen devolve o
-> comprimento. Pode-se ler e gravar caracteres por indice; o literal
-> de um caractere usa aspas duplas, como "a".

PROC maiusculas(destino, origem)
  DEF i, c
  StrCopy(destino, origem)
  FOR i := 0 TO (EstrLen(destino) - 1)
    c := destino[i]
    IF (c >= "a") AND (c <= "z")
      destino[i] := c - 32
    ENDIF
  ENDFOR
ENDPROC

PROC main()
  DEF texto[40]:STRING
  DEF copia[40]:STRING

  StrCopy(texto, 'Amiga E, de Wouter')
  WriteF('Original: \s\n', texto)
  WriteF('Comprimento: \d caracteres\n', EstrLen(texto))
  WriteF('Codigo do terceiro caractere: \d\n', texto[2])

  maiusculas(copia, texto)
  WriteF('Maiusculas: \s\n', copia)
ENDPROC
