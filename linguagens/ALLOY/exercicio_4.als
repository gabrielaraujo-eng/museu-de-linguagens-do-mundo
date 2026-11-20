// ============================================================
// Alloy - exercicio 4: quantificadores e cardinalidade
// ============================================================
// ENUNCIADO
// Modele Cidade com habitantes: one Int (em milhares). Expresse, com
// um quantificador diferente em cada fato:
//   all  - habitantes entre 0 e 1000
//   no   - nenhuma cidade com 0 habitantes
//   some - pelo menos uma cidade com mais de 500
//   one  - exatamente uma capital (assinatura Capital, subconjunto de Cidade)
//   lone - no maximo uma cidade com mais de 900
//   #    - o modelo tem exatamente 4 cidades
// Peca uma instancia com essas condicoes.
//
// RESOLUCAO

sig Cidade {
  habitantes: one Int
}

// Alloy nao tem tipo booleano de dados; "Capital" e um subconjunto de Cidade.
sig Capital in Cidade {}

fact faixaHabitantes {
  all c: Cidade | c.habitantes >= 0 and c.habitantes <= 1000
}

fact nenhumaVazia {
  no c: Cidade | c.habitantes = 0
}

fact existeGrande {
  some c: Cidade | c.habitantes > 500
}

fact umaCapital {
  one c: Cidade | c in Capital
}

fact noMaximoUmaMetropole {
  lone c: Cidade | c.habitantes > 900
}

fact quatroCidades {
  #Cidade = 4
}

// 11 bits cobrem -1024 a 1023, o suficiente para 1000.
run redeUrbana {
  some c: Cidade | c.habitantes = 1000
} for 4 but 11 Int
