(ns exemplo-17)
;; Lanca e captura explicitamente uma excecao JavaScript.
(try
  (throw (js/Error. "Falha intencional"))
  (catch js/Error e
    (println (str "Erro capturado: " (.-message e)))))
