-> exemplo_9.e -- Aritmetica inteira
-> Em E nao existe precedencia de operadores: as expressoes sao
-> avaliadas da esquerda para a direita. Por isso os parenteses sao
-> obrigatorios quando a ordem desejada difere da leitura linear.
-> A multiplicacao e a divisao do runtime trabalham em 16 bits, e MOD
-> devolve o resto da divisao inteira.

PROC main()
  DEF a, b, soma, produto, quociente, resto, media

  a := 17
  b := 5

  soma := a + b
  produto := a * b
  quociente := a / b
  resto := Mod(a, b)
  media := (a + b) / 2

  WriteF('\d + \d = \d\n', a, b, soma)
  WriteF('\d * \d = \d\n', a, b, produto)
  WriteF('\d / \d = \d (resto \d)\n', a, b, quociente, resto)
  WriteF('media inteira de \d e \d = \d\n', a, b, media)

  -> Sem parenteses, 2+3*4 vale (2+3)*4 = 20, e nao 14:
  WriteF('2 + 3 * 4 sem parenteses = \d\n', 2 + 3 * 4)
  WriteF('2 + (3 * 4) com parenteses = \d\n', 2 + (3 * 4))
ENDPROC
