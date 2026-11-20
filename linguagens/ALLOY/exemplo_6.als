// ============================================================
// Alloy - exemplo 6: estrutura de dados como relacao
// ============================================================
// Alloy nao tem tipo "lista" embutido. Uma lista ligada e modelada
// por uma assinatura de elementos e um campo relacional "prox".
//
// Operadores relacionais usados aqui:
//   .   composicao (join)
//   *   fecho reflexivo-transitivo
//   ^   fecho transitivo
//   ~   transposta (inversa) de uma relacao

sig Elemento {
  prox: lone Elemento
}

// "one sig" garante um unico objeto Lista, com uma cabeca opcional.
one sig Lista {
  cabeca: lone Elemento
}

// Todo elemento e alcancavel a partir da cabeca.
fact tudoAlcancavel {
  all e: Elemento | e in Lista.cabeca.*prox
}

// Nenhum elemento e alcancavel a partir de si mesmo: nao ha ciclo.
fact semCiclo {
  all e: Elemento | e not in e.^prox
}

// Cada elemento tem no maximo um antecessor: nao ha bifurcacao.
fact semCompartilhamento {
  all e: Elemento | lone e.~prox
}

// Escopo fixo para tornar a lista pequena e legivel.
fact listaDeTres {
  #Elemento = 3
}

run listaBemFormada {
  some Lista.cabeca
} for 4
