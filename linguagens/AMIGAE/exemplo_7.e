-> exemplo_7.e -- Tratamento de excecoes com HANDLE / EXCEPT / Raise
-> Um procedimento marcado com HANDLE instala um tratador. Se algo no
-> seu corpo chamar Raise('texto'), a execucao salta para o bloco
-> EXCEPT, onde a variavel global 'exception' contem o texto levantado.
-> EXCEPT DO funciona como bloco final: executa sempre, com ou sem erro.

PROC dividir(a, b)
  IF b = 0
    Raise('divisao por zero')
  ENDIF
ENDPROC a / b

PROC verificar_idade(idade)
  IF idade < 0
    Raise('idade negativa')
  ENDIF
  WriteF('idade aceita: \d\n', idade)
ENDPROC

PROC main() HANDLE
  WriteF('10 / 2 = \d\n', dividir(10, 2))
  WriteF('10 / 0 = \d\n', dividir(10, 0))
  WriteF('esta linha nao e alcancada\n')
EXCEPT
  WriteF('excecao capturada: \s\n', exception)
ENDPROC

-> O tratador acima cobre toda a chamada; a excecao interrompe o main()
-> e a mensagem levantada aparece em 'exception'.
