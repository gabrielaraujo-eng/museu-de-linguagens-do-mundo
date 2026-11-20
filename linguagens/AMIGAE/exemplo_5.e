-> exemplo_5.e -- Procedimentos, funcoes e recursao
-> PROC ... ENDPROC define um procedimento; se ele devolve valor, o
-> valor vai depois de ENDPROC ou depois de IS (forma concisa).
-> Em E os procedimentos podem ser chamados antes de serem definidos,
-> e uma funcao pode devolver ate tres valores ao mesmo tempo.

PROC soma(a, b) IS a + b

PROC fatorial(n)
  DEF resultado
  IF n <= 1
    resultado := 1
  ELSE
    resultado := n * fatorial(n - 1)
  ENDIF
ENDPROC resultado

PROC dividir(a, b)
  DEF quociente, resto
  quociente := a / b
  resto := Mod(a, b)
ENDPROC quociente, resto

PROC main()
  DEF q, r

  WriteF('soma(20, 22) = \d\n', soma(20, 22))
  WriteF('fatorial(6) = \d\n', fatorial(6))

  q, r := dividir(47, 5)
  WriteF('47 dividido por 5 = \d, resto \d\n', q, r)
ENDPROC
