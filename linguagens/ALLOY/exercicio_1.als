// ============================================================
// Alloy - exercicio 1: assinatura, campo e escopo
// ============================================================
// ENUNCIADO
// Modele uma biblioteca com duas assinaturas: Livro (sem campos) e
// Emprestimo, com o campo livro: one Livro. Exija que:
//   a) existam exatamente 2 livros;
//   b) exista exatamente 1 emprestimo;
//   c) cada livro tenha no maximo um emprestimo ativo.
// Escreva um comando "run" com escopo 3 e confirme que o Analyzer
// encontra uma instancia. Lembre: "run" procura uma ESTRUTURA, nao
// imprime mensagem.
//
// RESOLUCAO

sig Livro {}

sig Emprestimo {
  livro: one Livro
}

fact doisLivros {
  #Livro = 2
}

fact umEmprestimo {
  #Emprestimo = 1
}

// A transposta "~livro" leva de Livro para Emprestimo; com "lone"
// exigimos no maximo um emprestimo por livro.
fact noMaximoUmPorLivro {
  all l: Livro | lone l.~livro
}

run biblioteca {
  some Emprestimo
} for 3
