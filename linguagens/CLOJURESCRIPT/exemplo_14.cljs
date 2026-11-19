(ns exemplo-14)
;; Repete uma acao com loop e recur.
(loop [i 0]
  (when (< i 5)
    (println (str "Contagem: " i))
    (recur (inc i))))
