// ============================================================
// Alloy - exemplo 3: predicados com argumentos
// ============================================================
// Um predicado nomeia uma FORMULA reutilizavel. Seus parametros sao
// ligados pela chamada, como em "caro[p]", e nao sao variaveis que
// mudam de valor durante a analise.
//
// Predicados nao executam nada: apenas descrevem uma condicao que o
// Analyzer pode tentar satisfazer (run) ou refutar (check).

sig Produto {
  preco: one Int
}

// Predicado com um parametro tipado.
pred caro [p: Produto] {
  p.preco > 50
}

// Um predicado pode chamar outro predicado.
pred barato [p: Produto] {
  not caro[p]
}

// Existe pelo menos um produto caro no modelo.
fact existeCaro {
  some p: Produto | caro[p]
}

// Busca uma instancia com um produto caro e outro barato, distintos.
// 7 bits (-64 a 63) comportam o limite 50 com folga.
run doisPerfis {
  some disj p, q: Produto | caro[p] and barato[q]
} for 2 but 7 Int
