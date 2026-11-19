(ns exercicio-17)
;; Captura uma excecao e le sua propriedade message.
(try
  (throw (js/Error. "Erro de teste"))
  (catch js/Error e
    (println (str "Erro capturado: " (.-message e)))))
