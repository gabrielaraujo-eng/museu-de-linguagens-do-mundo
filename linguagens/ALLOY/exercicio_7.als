// ============================================================
// Alloy - exercicio 7: assertion que falha e modelo corrigido
// ============================================================
// ENUNCIADO
// (1) Modele Conta com saldo e limite, com saldo entre -100 e 100.
//     Tente verificar "saldo nunca e negativo" com "check" e observe
//     o contraexemplo devolvido pelo Analyzer.
// (2) Crie uma segunda assinatura ContaSegura, com o fato adicional
//     saldo >= 0, e verifique a mesma propriedade: agora nao deve
//     haver contraexemplo.
// Conclusao esperada: um "check" sem solucao significa que nao ha
// contraexemplo no escopo; um "check" com solucao e uma refutacao.
//
// RESOLUCAO

// ---------- (1) modelo permissivo: a propriedade e falsa ----------
sig Conta {
  saldo: one Int,
  limite: one Int
}

fact faixaPermitida {
  all c: Conta | c.saldo >= -100 and c.saldo <= 100
}

fact limiteNaoNegativo {
  all c: Conta | c.limite >= 0
}

assert saldoNuncaNegativo {
  all c: Conta | c.saldo >= 0
}

// O Analyzer encontra contraexemplo: uma Conta com saldo negativo.
check saldoNuncaNegativo for 2 but 8 Int

// ---------- (2) modelo corrigido: a propriedade passa ----------
sig ContaSegura {
  saldo: one Int,
  limite: one Int
}

fact saldoNaoNegativoSeguro {
  all c: ContaSegura | c.saldo >= 0 and c.saldo <= 100
}

assert saldoSempreNaoNegativo {
  all c: ContaSegura | c.saldo >= 0
}

// Sem contraexemplo: o comando nao produz solucao.
check saldoSempreNaoNegativo for 2 but 8 Int

// Instancia que confirma que o modelo corrigido nao e vazio.
run contaValida {
  some c: ContaSegura | c.saldo = 50
} for 2 but 8 Int
