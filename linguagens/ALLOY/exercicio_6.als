// ============================================================
// Alloy - exercicio 6: arvore binaria como estrutura relacional
// ============================================================
// ENUNCIADO
// Modele uma arvore binaria: No com os campos opcionais "esq" e
// "dir", e uma unica Arvore com campo "raiz". Exija que:
//   a) todo no seja alcancavel a partir da raiz;
//   b) nao exista ciclo (nenhum no e ancestral de si mesmo);
//   c) a raiz nao tenha pai;
//   d) a arvore tenha exatamente 5 nos.
// Verifique com "check" que nenhum no e ancestral de si mesmo e peca
// uma instancia com raiz definida.
//
// RESOLUCAO

sig No {
  esq: lone No,
  dir: lone No
}

one sig Arvore {
  raiz: lone No
}

fact tudoAlcancavelDaRaiz {
  all n: No | n in Arvore.raiz.*(esq + dir)
}

fact aciclica {
  all n: No | n not in n.^(esq + dir)
}

fact raizSemPai {
  all n: No | Arvore.raiz not in n.(esq + dir)
}

fact cincoNos {
  #No = 5
}

// Propriedade consequente do fato "aciclica": deve valer sem
// contraexemplo no escopo testado.
assert nenhumNoEhProprioAncestral {
  all n: No | n not in n.^(esq + dir)
}
check nenhumNoEhProprioAncestral for 6

run arvoreBinaria {
  some Arvore.raiz
} for 6
