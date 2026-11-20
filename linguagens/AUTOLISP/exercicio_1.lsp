;;; exercicio_1.lsp -- Saudacao em duas linhas
;;;
;;; Enunciado: escrever um comando que peca o nome do usuario e imprima
;;; uma saudacao de duas linhas na linha de comando do AutoCAD.
;;; Conceitos: defun com c:, princ, strcat, getstring com espacos.

;;; Parte pura: monta o texto, sem imprimir. Recebe nome e devolve string.
(defun monta-saudacao (nome)
  (strcat "Bem-vindo ao AutoLISP, " nome "!")
)

;;; getstring com o argumento T aceita espacos; sem T, o Enter encerraria
;;; a entrada no primeiro espaco. Devolve nil se o usuario cancelar.
(defun c:saudacao (/ nome)
  (setq nome (getstring T "\nDigite seu nome: "))
  (if (or (null nome) (= nome ""))
    (setq nome "visitante"))
  (princ "\n=== Museu de Linguagens do Mundo ===")
  (princ (strcat "\n" (monta-saudacao nome)))
  (princ "\n====================================")
  (princ)
)

(princ "\nexercicio_1.lsp carregado: digite SAUDACAO.")
(princ)
