(ns exercicio-14)
;; Faz uma contagem usando loop e recur.
(loop [i 0]
  (when (< i 3)
    (println (str "Contador: " i))
    (recur (inc i))))
