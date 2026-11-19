(ns exemplo-19)
;; Chama Math.sqrt por interop com o objeto global JavaScript.
(def numero 16)
(println (str "Raiz quadrada: " (.sqrt js/Math numero)))
