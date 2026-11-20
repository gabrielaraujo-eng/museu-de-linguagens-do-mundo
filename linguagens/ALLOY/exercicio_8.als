// ============================================================
// Alloy - exercicio 8: texto modelado por relacoes
// ============================================================
// ENUNCIADO
// Alloy nao tem String. Represente uma palavra como relacao de
// Posicao para Letra, com um campo inteiro "tamanho". Exija que as
// posicoes ocupadas formem um prefixo da ordem. Depois verifique com
// "check" que duas palavras com a mesma relacao de letras tem o mesmo
// tamanho, e peca uma instancia com uma palavra de tres letras.
//
// RESOLUCAO

open util/ordering[Posicao]

sig Posicao {}

sig Letra {}

sig Palavra {
  letra: Posicao -> lone Letra,
  tamanho: one Int
}

fun ocupadas [p: Palavra]: set Posicao {
  p.letra.Letra
}

fact tamanhoCoerente {
  all p: Palavra | p.tamanho = #ocupadas[p] and p.tamanho > 0
}

fact posicoesEmPrefixo {
  all p: Palavra | all x: Posicao |
    x not in ocupadas[p] implies (all y: ocupadas[p] | lt[y, x])
}

// Se a relacao posicao->letra e a mesma, o numero de posicoes
// ocupadas e o mesmo e, pelo fato acima, o tamanho tambem.
assert mesmoTextoMesmoTamanho {
  all disj p, q: Palavra | p.letra = q.letra implies p.tamanho = q.tamanho
}
check mesmoTextoMesmoTamanho for 4 but 5 Int

run palavraDeTresLetras {
  some p: Palavra | p.tamanho = 3
} for 4 but 5 Int
