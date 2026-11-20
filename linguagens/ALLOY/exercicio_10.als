// ============================================================
// Alloy - exercicio 10: ordem total e fila ordenada
// ============================================================
// ENUNCIADO
// Use o modulo util/ordering para modelar uma fila de senhas
// atendidas por prioridade. Cada Senha tem prioridade: one Int e as
// prioridades sao distintas. Exija que a ordem do modulo coincida com
// a ordem crescente de prioridade. Depois verifique com "check" que a
// ordem e total e transitiva, e peca uma instancia com tres senhas.
//
// RESOLUCAO

open util/ordering[Senha]

sig Senha {
  prioridade: one Int
}

fact prioridadesDistintas {
  all disj a, b: Senha | a.prioridade != b.prioridade
}

// "lt" e a comparacao do modulo de ordem; "next" devolve o sucessor.
// A comparacao de prioridade usa o operador inteiro "<".
fact ordemPorPrioridade {
  all a: Senha | a != last implies a.prioridade < next[a].prioridade
}

// Propriedade 1: a ordem e total (quaisquer duas senhas sao comparaveis).
assert ordemTotal {
  all disj a, b: Senha | lt[a, b] or lt[b, a]
}
check ordemTotal for 4

// Propriedade 2: a ordem e transitiva.
assert ordemTransitiva {
  all a, b, c: Senha | lt[a, b] and lt[b, c] implies lt[a, c]
}
check ordemTransitiva for 4

// Com util/ordering, o parametro do modulo e declarado "exactly": o
// escopo "for 3" fixa EXATAMENTE 3 senhas (nao "ate 3").
run filaDeTres {
  #Senha = 3
} for 3 but 5 Int
