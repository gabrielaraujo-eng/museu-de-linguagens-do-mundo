;;; exemplo_9.lsp -- Matematica e geometria de coordenadas
;;;
;;; Funcoes numericas do nucleo: + - * / 1+ 1- abs fix float rem max min
;;; expt sqrt sin cos atan log exp. A constante pi ja existe como simbolo.
;;; Angulos trigonometricos sao em radianos; angulos de entidades e de
;;; (angle ...) tambem sao em radianos, no sentido anti-horario.

(defun graus-para-radianos (g)
  (* g (/ pi 180.0))
)

(defun radianos-para-graus (r)
  (* r (/ 180.0 pi))
)

;;; Arredondamento com casas decimais: fix trunca em direcao ao zero,
;;; por isso o sinal precisa ser tratado separadamente.
(defun arredonda (x casas / fator)
  (setq fator (expt 10.0 casas))
  (if (>= x 0)
    (/ (fix (+ (* x fator) 0.5)) fator)
    (/ (fix (- (* x fator) 0.5)) fator))
)

;;; trigonometria: (atan y x) com dois argumentos equivale ao atan2 de
;;; outras linguagens e devolve o angulo no quadrante correto.
(defun trigonometria (/ ang)
  (setq ang (graus-para-radianos 30.0))
  (list (sin ang) (cos ang) (atan 1.0 1.0))
)

;;; Geometria de pontos. Um ponto e uma lista (x y z); z pode ser omitido
;;; nas funcoes de desenho, mas os pontos devolvidos por getpoint tem tres
;;; coordenadas.
(defun geometria (/ p1 p2)
  (setq p1 '(0.0 0.0 0.0)
        p2 '(30.0 40.0 0.0))
  (list
    (distance p1 p2)     ; 50.0
    (angle p1 p2)        ; 0.9273 rad
    (polar p1 0.0 10.0)) ; (10.0 0.0 0.0) -- ponto a 10 unidades no angulo 0
)

;;; Pitagoras e area, para mostrar composicao de funcoes puras.
(defun hipotenusa (a b)
  (sqrt (+ (* a a) (* b b)))
)

(defun area-triangulo-retangulo (a b)
  (/ (* a b) 2.0)
)

;;; Comando que desenha um retangulo a partir de um canto e das medidas.
;;; command envia a sequencia de teclas ao comando do AutoCAD; o "" final
;;; equivale a apertar Enter e encerra o comando.
(defun c:retangulo (/ p larg alt p2 p3 p4)
  (setq p (getpoint "\nCanto inferior esquerdo: "))
  (if p
    (progn
      (setq larg (getdist p "\nLargura: "))
      (setq alt (getdist p "\nAltura: "))
      (if (and larg alt)
        (progn
          (setq p2 (list (+ (car p) larg) (cadr p) 0.0)
                p3 (list (+ (car p) larg) (+ (cadr p) alt) 0.0)
                p4 (list (car p) (+ (cadr p) alt) 0.0))
          (setvar "CMDECHO" 0)
          (command "_.PLINE" p p2 p3 p4 "_C")
          (setvar "CMDECHO" 1)
          (princ (strcat "\nArea: " (rtos (* larg alt) 2 2))))
        (princ "\nMedidas invalidas.")))
    (princ "\nNenhum ponto informado."))
  (princ)
)

(princ "\nexemplo_9.lsp carregado: teste (arredonda 3.14159 2) e o comando RETANGULO.")
(princ)
