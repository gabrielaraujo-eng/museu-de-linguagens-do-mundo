// ============================================================
// Alloy - exemplo 1: assinatura e primeira analise
// ============================================================
// Alloy nao e uma linguagem imperativa. Nao existe "imprimir",
// atribuicao nem laco: um modelo Alloy declara ESTRUTURAS
// (conjuntos e relacoes) e o Alloy Analyzer procura instancias
// finitas que satisfacam as restricoes do modelo.
//
// Execucao usada na validacao:
//   java -jar org.alloytools.alloy.dist.jar exec -f -o - exemplo_1.als

// "one sig" declara um conjunto com exatamente um atomo.
one sig Museu {}

// "sig" simples declara um conjunto; a quantidade de atomos e
// decidida pelo escopo do comando de analise, nao pela declaracao.
sig Sala {}

// Um fato e uma restricao global: vale em toda instancia do modelo.
fact peloMenosUmaSala {
  some Sala
}

// Comando de analise: procurar uma instancia em que cada assinatura
// de nivel superior tenha no maximo 3 atomos. Museu continua com 1
// atomo por causa do "one".
run primeiraAnalise {} for 3
