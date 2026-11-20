-> exercicio_1.e -- Saida formatada
-> ENUNCIADO: escreva um programa que imprima um cartao de visitas com
-> tres linhas: nome, linguagem e ano de lancamento publico (1993).
-> Use WriteF com os especificadores \s e \d e termine com \n.
-> SOLUCAO:

PROC main()
  WriteF('==============================\n')
  WriteF('Nome......: \s\n', 'Wouter van Oortmerssen')
  WriteF('Linguagem.: \s\n', 'Amiga E')
  WriteF('Lancamento: \d\n', 1993)
  WriteF('==============================\n')
ENDPROC
