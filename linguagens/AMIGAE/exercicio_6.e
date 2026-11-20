-> exercicio_6.e -- E-lists
-> ENUNCIADO: crie uma lista imediata com seis precos, calcule o total,
-> o maior preco e a media inteira. Percorra a lista por indice e
-> imprima cada preco com WriteF.
-> SOLUCAO:

CONST ITENS=6

PROC main()
  DEF precos:PTR TO LONG
  DEF i, total, maior

  precos := [120, 45, 300, 78, 210, 99]:LONG

  total := 0
  maior := precos[0]
  FOR i := 0 TO (ITENS - 1)
    WriteF('item \d: \d\n', i + 1, precos[i])
    total := total + precos[i]
    IF precos[i] > maior
      maior := precos[i]
    ENDIF
  ENDFOR

  WriteF('total...: \d\n', total)
  WriteF('maior...: \d\n', maior)
  WriteF('media...: \d\n', total / ITENS)
ENDPROC
