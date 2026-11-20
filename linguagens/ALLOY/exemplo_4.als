// ============================================================
// Alloy - exemplo 4: quantificacao (e nao lacos)
// ============================================================
// Alloy nao tem "for", "while" nem repeticao. O que existe sao
// QUANTIFICADORES sobre conjuntos e relacoes:
//   all  - todos os elementos satisfazem
//   some - pelo menos um satisfaz
//   no   - nenhum satisfaz
//   one  - exatamente um satisfaz
//   lone - no maximo um satisfaz
// O cardinal "#" conta elementos de um conjunto.

sig Aluno {
  nota: one Int
}

pred aprovado [a: Aluno] {
  a.nota >= 6
}

// all: toda nota esta na faixa valida.
fact notasValidas {
  all a: Aluno | a.nota >= 0 and a.nota <= 10
}

// some: existe pelo menos um aprovado.
fact existeAprovado {
  some a: Aluno | aprovado[a]
}

// no: ninguem tirou zero.
fact ninguemComZero {
  no a: Aluno | a.nota = 0
}

// one: exatamente um aluno tirou 10.
fact umDestaque {
  one a: Aluno | a.nota = 10
}

// lone: no maximo um reprovado.
fact noMaximoUmReprovado {
  lone a: Aluno | a.nota < 6
}

// disj: os dois alunos quantificados sao distintos.
fact notasDistintas {
  all disj a, b: Aluno | a.nota != b.nota
}

// Cardinalidade do conjunto Aluno.
fact turmaPequena {
  #Aluno <= 3
}

// Instancia com a turma cheia: tres alunos.
run turmaCheia {
  #Aluno = 3
} for 3 but 5 Int
