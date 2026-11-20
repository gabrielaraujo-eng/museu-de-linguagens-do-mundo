// ============================================================
// Alloy - exemplo 2: assinaturas, campos relacionais e inteiros
// ============================================================
// Um campo de assinatura e uma RELACAO, nao uma variavel mutavel.
// "preco: one Int" diz que cada Produto se relaciona com exatamente
// um inteiro.
//
// Int em Alloy e FINITO: o escopo "for N Int" fixa a largura de bits.
// Com 4 bits (padrao) os valores vao de -8 a 7, portanto o limite 100
// usado abaixo exige 8 bits (-128 a 127).

sig Produto {
  preco: one Int,
  estoque: one Int
}

// Restricao global sobre os valores dos campos.
fact precosNoIntervalo {
  all p: Produto | p.preco >= 0 and p.preco <= 100
}

fact estoqueNaoNegativo {
  all p: Produto | p.estoque >= 0
}

// Predicado sem parametros: pode ser usado diretamente em "run".
pred temEstoque {
  some p: Produto | p.estoque > 0
}

// Escopo: ate 3 produtos e inteiros de 8 bits.
run temEstoque for 3 but 8 Int
