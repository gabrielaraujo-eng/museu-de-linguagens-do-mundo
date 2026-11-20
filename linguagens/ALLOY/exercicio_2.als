// ============================================================
// Alloy - exercicio 2: campos inteiros e bit-width
// ============================================================
// ENUNCIADO
// Crie a assinatura Turma com os campos inteiros "vagas" e
// "matriculados". Imponha 0 <= matriculados <= vagas <= 40. Depois
// peca uma instancia com a turma lotada (matriculados = vagas = 40).
// Escolha um escopo de Int que comporte o valor 40 e justifique a
// escolha em comentario.
//
// RESOLUCAO

sig Turma {
  vagas: one Int,
  matriculados: one Int
}

fact coerencia {
  all t: Turma |
    t.matriculados >= 0
    and t.matriculados <= t.vagas
    and t.vagas <= 40
}

pred turmaLotada {
  some t: Turma | t.matriculados = 40 and t.vagas = 40
}

// 7 bits cobrem -64 a 63, portanto 40 e representavel.
// Com o padrao de 4 bits (-8 a 7) o valor 40 nao existiria e o
// predicado seria insatisfazivel.
run turmaLotada for 2 but 7 Int
