// ============================================================
// Alloy - exercicio 3: predicados que reutilizam predicados
// ============================================================
// ENUNCIADO
// Defina a assinatura Aluno com o campo media: one Int, restrito a
// 0..10. Escreva tres predicados com parametro:
//   aprovado     - media >= 7
//   reprovado    - media < 4
//   recuperacao  - nem aprovado nem reprovado
// O predicado "recuperacao" deve ser definido CHAMANDO os outros dois.
// Por fim, peca uma instancia com um aluno em recuperacao de media 5.
//
// RESOLUCAO

sig Aluno {
  media: one Int
}

fact mediaValida {
  all a: Aluno | a.media >= 0 and a.media <= 10
}

pred aprovado [a: Aluno] {
  a.media >= 7
}

pred reprovado [a: Aluno] {
  a.media < 4
}

// Reutilizacao: a formula de recuperacao e composta pelas anteriores.
pred recuperacao [a: Aluno] {
  not aprovado[a] and not reprovado[a]
}

run casoDeRecuperacao {
  some a: Aluno | recuperacao[a] and a.media = 5
} for 2 but 5 Int
