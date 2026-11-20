// ============================================================
// Alloy - exemplo 8: texto sem tipo String
// ============================================================
// Alloy NAO possui tipo nem literal de string. Texto e modelado com
// assinaturas e relacoes: aqui, uma Palavra associa POSICOES a LETRAS.
//
// O modulo util/ordering fornece uma ordem total sobre Posicao, com
// first, last, next, lt (menor que) e lte.

open util/ordering[Posicao]

sig Posicao {}

sig Letra {}

sig Palavra {
  // Relacao: cada posicao ocupada tem no maximo uma letra.
  letra: Posicao -> lone Letra,
  tamanho: one Int
}

// Dominio da relacao: as posicoes efetivamente ocupadas.
// p.letra.Letra devolve as posicoes cuja imagem esta em Letra.
fun ocupadas [p: Palavra]: set Posicao {
  p.letra.Letra
}

// O tamanho declarado coincide com o numero de posicoes ocupadas.
fact tamanhoCoerente {
  all p: Palavra | p.tamanho = #ocupadas[p] and p.tamanho > 0
}

// As posicoes ocupadas formam um prefixo: toda posicao livre vem
// depois de todas as posicoes ocupadas.
fact posicoesEmPrefixo {
  all p: Palavra | all x: Posicao |
    x not in ocupadas[p] implies (all y: ocupadas[p] | lt[y, x])
}

// Aplicacao relacional: p.letra[first] e a letra da primeira posicao.
pred comecaCom [p: Palavra, l: Letra] {
  p.letra[first] = l
}

// Toda palavra nao vazia tem exatamente uma primeira letra.
assert primeiraLetraUnica {
  all p: Palavra | one p.letra[first]
}
check primeiraLetraUnica for 4 but 5 Int

// Instancia: uma palavra de duas letras que comeca com uma letra dada.
run palavraCurta {
  some p: Palavra, l: Letra | p.tamanho = 2 and comecaCom[p, l]
} for 4 but 5 Int
