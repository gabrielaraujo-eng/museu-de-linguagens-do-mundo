// ============================================================
// Alloy - exercicio 9: aritmetica finita e estouro
// ============================================================
// ENUNCIADO
// (1) Mostre com "run" que, com 4 bits, a soma 6 + 3 nao cabe no
//     intervalo -8..7 e o resultado observado e -7.
// (2) Mostre com "run" que, com 5 bits, 6 + 3 = 9.
// (3) Verifique com "check" que o dobro de qualquer inteiro do escopo
//     e par, isto e, que (v.mul[2]).rem[2] = 0.
// Explique em comentario por que (3) continua valendo mesmo quando o
// dobro estoura.
//
// RESOLUCAO

// ---------- (1) estouro com 4 bits ----------
pred estouroComQuatroBits {
  6.add[3] = -7
}
run estouroComQuatroBits for 4 Int

// ---------- (2) o mesmo calculo com 5 bits ----------
pred somaComCincoBits {
  6.add[3] = 9
}
run somaComCincoBits for 5 Int

// ---------- (3) paridade do dobro ----------
// Um estouro subtrai ou soma um multiplo de 2^N (N = largura em bits).
// Como 2^N e par, a paridade do resultado nao muda: o dobro de um
// inteiro continua par mesmo depois de dar a volta no intervalo.
assert dobroEhSemprePar {
  all v: Int | v.mul[2].rem[2] = 0
}
check dobroEhSemprePar for 5 Int
