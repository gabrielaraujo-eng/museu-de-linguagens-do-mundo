-> exercicio_4.e -- Repeticao
-> ENUNCIADO: some todos os numeros pares de 1 a 100 usando FOR/ENDFOR,
-> conte quantos sao e calcule a media. Depois repita o calculo com
-> WHILE e confirme que os dois resultados coincidem.
-> SOLUCAO:

PROC main()
  DEF i, soma, contador, media, soma2

  soma := 0
  contador := 0
  FOR i := 1 TO 100
    IF (Mod(i, 2)) = 0
      soma := soma + i
      contador := contador + 1
    ENDIF
  ENDFOR
  media := soma / contador

  WriteF('Quantidade de pares: \d\n', contador)
  WriteF('Soma dos pares....: \d\n', soma)
  WriteF('Media dos pares....: \d\n', media)

  soma2 := 0
  i := 2
  WHILE i <= 100
    soma2 := soma2 + i
    i := i + 2
  ENDWHILE
  WriteF('Soma com WHILE....: \d\n', soma2)
  IF soma = soma2
    WriteF('Os dois lacos concordam.\n')
  ELSE
    WriteF('Divergencia entre os lacos.\n')
  ENDIF
ENDPROC
