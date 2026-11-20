-> exemplo_1.e -- Primeiro programa: saida de texto no AmigaOS
-> Compile com: ec exemplo_1.e
-> Todo programa Amiga E comeca a execucao no procedimento main().
-> WriteF e a funcao de saida formatada do runtime do E: o primeiro
-> argumento e o formato e os demais sao os valores inseridos nele.
-> Nas strings de formato, \n quebra a linha e \d imprime um inteiro.

PROC main()
  WriteF('Ola, Mundo!\n')
  WriteF('Este texto foi escrito por WriteF.\n')
  WriteF('O programa tem \d linha de codigo util.\n', 2)
ENDPROC
