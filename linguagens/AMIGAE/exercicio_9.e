-> exercicio_9.e -- Matematica inteira
-> ENUNCIADO: calcule o maximo divisor comum de 84 e 30 pelo algoritmo
-> de Euclides (restos sucessivos com MOD) e, a partir dele, o minimo
-> multiplo comum. Mostre cada resto intermediario.
-> SOLUCAO:

PROC mdc(a, b)
  DEF resto, passo
  passo := 0
  WHILE b <> 0
    resto := Mod(a, b)
    passo := passo + 1
    WriteF('passo \d: \d MOD \d = \d\n', passo, a, b, resto)
    a := b
    b := resto
  ENDWHILE
ENDPROC a

PROC main()
  DEF x, y, divisor, mmc

  x := 84
  y := 30
  divisor := mdc(x, y)
  mmc := (x / divisor) * y

  WriteF('mdc(\d, \d) = \d\n', x, y, divisor)
  WriteF('mmc(\d, \d) = \d\n', x, y, mmc)
  WriteF('conferencia: mdc * mmc = \d\n', divisor * mmc)
ENDPROC
