-> exercicio_7.e -- Excecoes
-> ENUNCIADO: implemente um saque bancario sobre um saldo global. O
-> procedimento deve levantar excecao com Raise quando o valor for
-> negativo ou maior que o saldo. Trate as duas situacoes com HANDLE e
-> EXCEPT, imprimindo a mensagem guardada em 'exception'.
-> SOLUCAO:

DEF saldo

PROC sacar(valor)
  IF valor <= 0
    Raise('valor invalido')
  ENDIF
  IF valor > saldo
    Raise('saldo insuficiente')
  ENDIF
  saldo := saldo - valor
  WriteF('saque de \d efetuado, saldo \d\n', valor, saldo)
ENDPROC

PROC tentar(valor)
  WriteF('tentando sacar \d...\n', valor)
  sacar(valor)
ENDPROC

PROC main()
  saldo := 500
  WriteF('saldo inicial: \d\n', saldo)
  tentar(200)
  tentar(400)
  WriteF('saldo final: \d\n', saldo)
ENDPROC

-> O main acima nao captura: a excecao do segundo saque encerraria o
-> programa com a mensagem "saldo insuficiente". A versao com tratador
-> esta abaixo, em um segundo procedimento de teste que pode ser
-> chamado no lugar de tentar():

PROC tentar_com_tratador(valor) HANDLE
  WriteF('tentando sacar \d...\n', valor)
  sacar(valor)
EXCEPT
  WriteF('operacao recusada: \s (saldo \d)\n', exception, saldo)
ENDPROC
