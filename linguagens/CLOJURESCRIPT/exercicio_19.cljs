(ns exercicio-19)
;; Chama Math.pow por interop com o objeto global JavaScript.
(println (str "2 elevado a 3: " (.pow js/Math 2 3)))
