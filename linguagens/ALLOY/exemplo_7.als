// ============================================================
// Alloy - exemplo 7: assertions, contraexemplos e inconsistencia
// ============================================================
// Alloy nao tem try/catch: nao existe erro em tempo de execucao.
// O que existe e ANALISE:
//   check A  -> procura um CONTRAEXEMPLO de A; se nao achar, A vale
//               no escopo testado.
//   run P    -> procura uma INSTANCIA de P; se nao achar, P e
//               inconsistente naquele escopo.
// Um modelo inconsistente e aquele em que "run {}" nao acha instancia.

sig Pessoa {
  idade: one Int
}

fact idadeNaoNegativa {
  all p: Pessoa | p.idade >= 0
}

// Assertion valida: decorre diretamente do fato acima.
// O Analyzer nao encontra contraexemplo e nao imprime solucao.
assert idadeSempreNaoNegativa {
  all p: Pessoa | p.idade >= 0
}
check idadeSempreNaoNegativa for 3 but 6 Int

// Assertion invalida: o fato nao obriga a maioridade.
// O Analyzer devolve um contraexemplo (uma Pessoa com idade < 18).
assert todosAdultos {
  all p: Pessoa | p.idade >= 18
}
check todosAdultos for 3 but 6 Int

// Predicado contraditorio: exige dois valores para o mesmo campo.
// "run" nao encontra instancia, o que caracteriza inconsistencia.
pred contradicao {
  some p: Pessoa | p.idade = 5 and p.idade = 7
}
run contradicao for 2 but 6 Int
