-> exemplo_3.e -- Controle de fluxo: IF/ELSEIF/ELSE/ENDIF e SELECT/CASE
-> E aceita a forma em bloco (IF ... ENDIF) e a forma horizontal
-> IF cond THEN comando. Aqui usamos a forma em bloco, mais legivel.
-> SELECT expr OF n escolhe entre n alternativas; CASE aceita listas
-> separadas por virgula e intervalos com TO. DEFAULT cobre o resto.

PROC classificar(idade)
  IF idade < 12
    WriteF('\d anos: crianca\n', idade)
  ELSEIF idade < 18
    WriteF('\d anos: adolescente\n', idade)
  ELSE
    WriteF('\d anos: adulto\n', idade)
  ENDIF
ENDPROC

PROC main()
  DEF dia

  classificar(8)
  classificar(15)
  classificar(42)

  dia := 6
  SELECT 8 OF dia
  CASE 2, 3, 4, 5, 6
    WriteF('dia \d: dia util\n', dia)
  CASE 7
    WriteF('dia \d: sabado\n', dia)
  CASE 1
    WriteF('dia \d: domingo\n', dia)
  DEFAULT
    WriteF('dia \d: invalido\n', dia)
  ENDSELECT

  IF dia > 5 THEN WriteF('fim de semana chegando\n')
ENDPROC
