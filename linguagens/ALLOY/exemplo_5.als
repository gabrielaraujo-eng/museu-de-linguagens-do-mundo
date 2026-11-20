// ============================================================
// Alloy - exemplo 5: funcoes
// ============================================================
// Uma funcao devolve uma EXPRESSAO; um predicado devolve uma formula
// (verdadeiro/falso). Funcoes nao tem efeito colateral e nao podem
// conter comandos: sao apenas abreviacoes de expressoes.
//
// Operadores inteiros: add, sub, mul, div, rem (forma a.add[b]).

fun soma [a, b: Int]: Int {
  a.add[b]
}

// Funcao que chama outra funcao.
fun dobro [a: Int]: Int {
  soma[a, a]
}

fun media [a, b: Int]: Int {
  soma[a, b].div[2]
}

// Condicional como EXPRESSAO: "condicao => valor else valor".
fun maior [a, b: Int]: Int {
  a > b => a else b
}

// Verificacao: cada igualdade e uma restricao que o Analyzer deve
// satisfazer dentro do escopo inteiro indicado.
pred verificacao {
  soma[2, 3] = 5
  dobro[4] = 8
  media[4, 6] = 5
  maior[3, 7] = 7
}

// 6 bits: -32 a 31, suficiente para todos os valores usados.
run verificacao for 6 Int
