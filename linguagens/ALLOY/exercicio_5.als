// ============================================================
// Alloy - exercicio 5: funcoes compostas e verificacao
// ============================================================
// ENUNCIADO
// Defina funcoes inteiras:
//   soma[a,b]        -> a + b
//   soma3[a,b,c]     -> soma[soma[a,b],c]
//   media3[a,b,c]    -> soma3 dividido por 3
//   maximo[a,b]      -> o maior, usando condicional como expressao
//   minimo[a,b]      -> o menor
// Depois escreva um predicado de verificacao com quatro igualdades
// (media3[2,4,9] = 5, maximo[2,9] = 9, minimo[2,9] = 2, soma3[1,2,3] = 6)
// e execute-o com "run".
//
// RESOLUCAO

fun soma [a, b: Int]: Int {
  a.add[b]
}

fun soma3 [a, b, c: Int]: Int {
  soma[soma[a, b], c]
}

fun media3 [a, b, c: Int]: Int {
  soma3[a, b, c].div[3]
}

fun maximo [a, b: Int]: Int {
  a >= b => a else b
}

fun minimo [a, b: Int]: Int {
  a <= b => a else b
}

pred verificacao {
  media3[2, 4, 9] = 5
  maximo[2, 9] = 9
  minimo[2, 9] = 2
  soma3[1, 2, 3] = 6
}

run verificacao for 6 Int
