// ============================================================
// Alloy - exemplo 10: Alloy 6, estado mutavel e logica temporal
// ============================================================
// Ate a versao 5, um modelo Alloy descrevia um unico estado. Alloy 6
// acrescenta assinaturas e campos MUTAVEIS (var) e operadores
// temporais que falam sobre tracos (sequencias de estados):
//   always F     - F vale em todos os estados do traco
//   eventually F - F vale em algum estado futuro (incluindo o atual)
//   after F      - F vale no estado seguinte
//   F until G    - F vale ate G valer
//   e'           - valor de e no estado seguinte
// O escopo "for N steps" limita o comprimento do traco.

enum Cor { Vermelho, Amarelo, Verde }

var sig Semaforo {
  var cor: one Cor
}

// Invariante: em todo estado o semaforo tem exatamente uma cor.
fact umaCorPorEstado {
  always (one Semaforo.cor)
}

// Transicoes permitidas entre estados consecutivos.
fact cicloDeCores {
  always (
    (Semaforo.cor = Vermelho implies after Semaforo.cor = Verde)
    and (Semaforo.cor = Verde implies after Semaforo.cor = Amarelo)
    and (Semaforo.cor = Amarelo implies after Semaforo.cor = Vermelho)
  )
}

// A cor amarela e alcancada em algum estado futuro do traco.
fact amareloAlcancado {
  eventually Semaforo.cor = Amarelo
}

// Instancia: um traco que comeca com o semaforo vermelho.
run comecaVermelho {
  Semaforo.cor = Vermelho
} for 4 steps

// Verificacao sobre todos os tracos de ate 4 estados.
assert sempreDefinida {
  always (some Semaforo.cor)
}
check sempreDefinida for 4 steps
