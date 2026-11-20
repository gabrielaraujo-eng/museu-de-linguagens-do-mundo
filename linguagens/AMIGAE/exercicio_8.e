-> exercicio_8.e -- Strings
-> ENUNCIADO: leia a string fixa "Amiga E" em uma variavel STRING,
-> conte quantas vogais ela tem e produza uma copia invertida. Imprima
-> a string original, o numero de vogais e a copia invertida.
-> SOLUCAO:

PROC eh_vogal(c)
  DEF resposta
  resposta := FALSE
  IF (c = "a") OR (c = "e") OR (c = "i") OR (c = "o") OR (c = "u")
    resposta := TRUE
  ENDIF
ENDPROC resposta

PROC contar_vogais(texto)
  DEF i, total
  total := 0
  FOR i := 0 TO (EstrLen(texto) - 1)
    IF eh_vogal(texto[i])
      total := total + 1
    ENDIF
  ENDFOR
ENDPROC total

PROC inverter(destino, origem)
  DEF i, n
  n := EstrLen(origem)
  FOR i := 0 TO (n - 1)
    destino[i] := origem[n - 1 - i]
  ENDFOR
  destino[n] := 0
ENDPROC

PROC main()
  DEF texto[40]:STRING
  DEF invertida[40]:STRING

  StrCopy(texto, 'amiga e')
  inverter(invertida, texto)

  WriteF('original..: \s\n', texto)
  WriteF('comprimento: \d\n', EstrLen(texto))
  WriteF('vogais....: \d\n', contar_vogais(texto))
  WriteF('invertida.: \s\n', invertida)
ENDPROC
