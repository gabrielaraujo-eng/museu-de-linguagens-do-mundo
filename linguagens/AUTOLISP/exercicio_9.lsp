;;; exercicio_9.lsp -- Medir distancia e angulo entre dois pontos
;;;
;;; Enunciado: pedir dois pontos ao usuario, informar distancia, angulo em
;;; graus e ponto medio, e desenhar a linha e um circulo de raio igual a
;;; metade da distancia.
;;; Conceitos: getpoint, distance, angle, polar, car/cadr, command.

;;; Ponto medio: media aritmetica das coordenadas X e Y.
(defun ponto-medio (p1 p2)
  (list (/ (+ (car p1) (car p2)) 2.0)
        (/ (+ (cadr p1) (cadr p2)) 2.0)
        0.0)
)

;;; angle devolve radianos no sentido anti-horario a partir do eixo X;
;;; multiplicar por 180/pi converte para graus.
(defun angulo-em-graus (p1 p2)
  (* (angle p1 p2) (/ 180.0 pi))
)

;;; Relatorio em forma de lista de strings, sem desenhar nada.
(defun relatorio-medicao (p1 p2 / d)
  (setq d (distance p1 p2))
  (list
    (strcat "Distancia: " (rtos d 2 3))
    (strcat "Angulo: " (rtos (angulo-em-graus p1 p2) 2 2) " graus")
    (strcat "Raio sugerido: " (rtos (/ d 2.0) 2 3)))
)

(defun c:medir (/ p1 p2 linhas d)
  (setq p1 (getpoint "\nPrimeiro ponto: "))
  (setq p2 (if p1 (getpoint p1 "\nSegundo ponto: ") nil))
  (if (and p1 p2)
    (progn
      (foreach linhas (relatorio-medicao p1 p2)
        (princ (strcat "\n" linhas)))
      (setq d (distance p1 p2))
      (setvar "CMDECHO" 0)
      (command "_.LINE" p1 p2 "")
      (command "_.CIRCLE" (ponto-medio p1 p2) (/ d 2.0))
      (setvar "CMDECHO" 1)
      (princ "\nLinha e circulo desenhados."))
    (princ "\nPontos nao informados; nada foi desenhado."))
  (princ)
)

(princ "\nexercicio_9.lsp carregado: digite MEDIR ou teste (angulo-em-graus '(0 0 0) '(1 1 0)).")
(princ)
