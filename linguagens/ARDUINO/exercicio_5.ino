/*
  exercicio_5.ino - Funções: potência recursiva, média ponderada e aprovação

  Objetivo: praticar três formatos de função:
    long potencia(int base, int expoente)   -> recursiva, retorna long
    float mediaPonderada(...)               -> parâmetros float, retorna float
    bool aprovado(float media)              -> retorna bool

  A recursão é segura aqui porque o expoente é pequeno: cada chamada
  consome alguns bytes da pilha, e o UNO tem 2 KB de SRAM.

  Não é preciso hardware.
*/

#define NOTA_MINIMA 6.0

long potencia(int base, int expoente) {
  if (expoente == 0) {
    return 1;  // caso base: qualquer número elevado a zero é 1
  }
  return (long)base * potencia(base, expoente - 1);
}

float mediaPonderada(float n1, float peso1, float n2, float peso2) {
  return (n1 * peso1 + n2 * peso2) / (peso1 + peso2);
}

bool aprovado(float media) {
  return media >= NOTA_MINIMA;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 5: funcoes");

  Serial.print("2^10 = ");
  Serial.println(potencia(2, 10));
  Serial.print("3^5  = ");
  Serial.println(potencia(3, 5));
  Serial.print("7^0  = ");
  Serial.println(potencia(7, 0));

  float prova = 7.5;
  float trabalho = 9.0;
  float media = mediaPonderada(prova, 3.0, trabalho, 1.0);

  Serial.print("Prova ");
  Serial.print(prova, 1);
  Serial.print(" (peso 3) e trabalho ");
  Serial.print(trabalho, 1);
  Serial.print(" (peso 1) -> media ");
  Serial.println(media, 2);

  Serial.print("Situacao: ");
  Serial.println(aprovado(media) ? "aprovado" : "reprovado");
}

void loop() {
  // Reavalia a cada 8 segundos com uma nota de prova que varia,
  // mostrando que as funções são reutilizáveis.
  static int passo = 0;
  float prova = 4.0 + passo;  // 4.0, 5.0, 6.0, ...

  float media = mediaPonderada(prova, 3.0, 9.0, 1.0);
  Serial.print("Prova ");
  Serial.print(prova, 1);
  Serial.print(" -> media ");
  Serial.print(media, 2);
  Serial.print(" -> ");
  Serial.println(aprovado(media) ? "aprovado" : "reprovado");

  passo = (passo + 1) % 6;
  delay(8000);
}
