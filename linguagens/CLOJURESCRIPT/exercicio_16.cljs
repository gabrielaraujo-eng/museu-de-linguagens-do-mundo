(ns exercicio-16
  (:require [clojure.string :as str]))
;; Junta os nomes de cores com um separador.
(def cores ["vermelho" "verde" "azul"])
(println (str/join ", " cores))
