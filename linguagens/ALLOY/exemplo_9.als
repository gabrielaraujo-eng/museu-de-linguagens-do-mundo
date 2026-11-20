// ============================================================
// Alloy - exemplo 9: aritmetica de inteiros com escopo finito
// ============================================================
// Alloy tem inteiros, mas eles sao FINITOS: "for N Int" fixa a
// largura em bits e os valores formam um intervalo fechado.
//   4 bits -> -8 a 7
//   5 bits -> -16 a 15
//   8 bits -> -128 a 127
// Operacoes que saem do intervalo "estouram" e o resultado volta
// ao intervalo por aritmetica modular.
//
// Operadores: add, sub, mul, div, rem e o agregado sum.

sig Conta {
  saldo: one Int
}

fun creditar [c: Conta, v: Int]: Int {
  c.saldo.add[v]
}

fun debitar [c: Conta, v: Int]: Int {
  c.saldo.sub[v]
}

fun metade [v: Int]: Int {
  v.div[2]
}

fun resto [v: Int]: Int {
  v.rem[2]
}

fact saldoValido {
  all c: Conta | c.saldo >= 0 and c.saldo <= 100
}

// Existe conta com saldo par cuja metade e 5 (ou seja, saldo 10).
pred contaPar {
  some c: Conta | resto[c.saldo] = 0 and metade[c.saldo] = 5
}
run contaPar for 2 but 8 Int

// Estouro com 4 bits: 6 + 3 = 9, que nao cabe em -8..7.
// O Analyzer calcula 9 - 16 = -7.
pred estouro {
  6.add[3] = -7
}
run estouro for 4 Int

// Com 5 bits o mesmo calculo cabe no intervalo e da 9.
pred semEstouro {
  6.add[3] = 9
}
run semEstouro for 5 Int
