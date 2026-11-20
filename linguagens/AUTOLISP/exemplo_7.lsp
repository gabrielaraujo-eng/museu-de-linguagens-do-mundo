;;; exemplo_7.lsp -- Tratamento de erros
;;;
;;; AutoLISP nao tem try/catch. O AutoCAD guarda na variavel *error* uma
;;; funcao que ele chama quando algo da errado durante a execucao (Esc,
;;; funcao cancelada, erro de tipo, variavel nao definida). Essa funcao
;;; recebe um argumento: a mensagem de erro em forma de string.
;;;
;;; O idioma padrao e: guardar o *error* atual, instalar o proprio,
;;; executar o trabalho e restaurar o original no fim. Sem isso, o
;;; tratamento de erros do usuario substitui o de outros programas.

;;; Erros que representam cancelamento do usuario e nao precisam de
;;; mensagem adicional: o AutoCAD ja avisa na linha de comando.
(defun erro-cancelamento-p (msg)
  (member msg '("console break"
                "Function cancelled"
                "quit / exit abort"))
)

(defun meu-erro (msg)
  (if (not (erro-cancelamento-p msg))
    (princ (strcat "\nErro: " msg)))
  ;; Restaura o que foi alterado antes do erro e devolve o controle.
  (setvar "CMDECHO" 1)
  (setq *error* *erro-anterior*)
  (princ)
)

;;; Verificacao defensiva: nunca dividir sem testar o divisor. Nao e
;;; tratamento de erro, e prevencao -- o mais comum em AutoLISP, porque
;;; uma divisao por zero interrompe a rotina inteira.
(defun divide-seguro (a b)
  (cond
    ((null b) nil)
    ((equal b 0) nil)
    (T (/ a b)))
)

;;; Rotina completa com tratamento de erro e restauracao de variaveis de
;;; sistema. setvar/getvar acessam as variaveis do desenho.
(defun c:teste_erro (/ valor resultado)
  (setq *erro-anterior* *error*)
  (setq *error* meu-erro)
  (setvar "CMDECHO" 0)
  (setq valor (getreal "\nDividendo (Esc cancela): "))
  (setq resultado (divide-seguro 100.0 valor))
  (if resultado
    (princ (strcat "\n100 / " (rtos valor 2 2) " = " (rtos resultado 2 4)))
    (princ "\nDivisao invalida: divisor nulo."))
  (setvar "CMDECHO" 1)
  (setq *error* *erro-anterior*)
  (princ)
)

;;; Erros tambem podem ser evitados testando o valor devolvido pelas
;;; funcoes de entrada: getpoint, getreal, getint e getstring devolvem
;;; nil quando o usuario cancela ou aperta Enter sem digitar nada.
(defun c:pede_numero (/ n)
  (setq n (getint "\nNumero inteiro: "))
  (cond
    ((null n) (princ "\nNenhum valor informado."))
    ((< n 0)  (princ "\nO numero e negativo."))
    (T        (princ (strcat "\nNumero aceito: " (itoa n)))))
  (princ)
)

(princ "\nexemplo_7.lsp carregado: teste (divide-seguro 10 4) e o comando TESTE_ERRO.")
(princ)
