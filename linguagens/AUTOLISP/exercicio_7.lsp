;;; exercicio_7.lsp -- Media de medidas com protecao contra lista vazia
;;;
;;; Enunciado: calcular a media de uma lista de medidas, sem quebrar a
;;; rotina quando a lista estiver vazia ou contiver valores invalidos, e
;;; garantir a restauracao das variaveis de sistema mesmo se o usuario
;;; cancelar com Esc.
;;; Conceitos: *error*, setvar/getvar, teste de divisor nulo, null.

;;; Guarda o *error* anterior para restaurar depois. Se algo falhar no
;;; meio do comando, esta funcao devolve o ambiente ao estado inicial.
(defun restaura-ambiente (msg)
  (if (not (member msg '("console break" "Function cancelled")))
    (princ (strcat "\nRotina interrompida: " msg)))
  (setvar "CMDECHO" 1)
  (setvar "OSMODE" *osmode-anterior*)
  (setq *error* *erro-anterior*)
  (princ)
)

;;; Media protegida: lista vazia nao tem media; devolvemos nil em vez de
;;; dividir por zero, que interromperia o comando.
(defun media-segura (lst / soma n)
  (if (null lst)
    nil
    (progn
      (setq soma 0
            n 0)
      (foreach x lst
        (if (numberp x)
          (progn
            (setq soma (+ soma x))
            (setq n (1+ n)))))
      (if (equal n 0)
        nil
        (/ soma (float n)))))
)

;;; numberp existe no nucleo e responde "e numero?" sem gerar erro.
(defun c:media (/ medidas resultado)
  (setq *erro-anterior* *error*
        *osmode-anterior* (getvar "OSMODE"))
  (setq *error* restaura-ambiente)
  (setvar "OSMODE" 0)
  (setvar "CMDECHO" 0)
  (setq medidas (list 12.5 18.0 "vazio" 20.5 9.0))
  (setq resultado (media-segura medidas))
  (if resultado
    (princ (strcat "\nMedia das medidas validas: " (rtos resultado 2 3)))
    (princ "\nNao ha medidas validas para calcular a media."))
  (setvar "OSMODE" *osmode-anterior*)
  (setvar "CMDECHO" 1)
  (setq *error* *erro-anterior*)
  (princ)
)

(princ "\nexercicio_7.lsp carregado: digite MEDIA ou teste (media-segura '(1 2 3)).")
(princ)
