/*
  exemplo_3.ino - Controle de fluxo: if / else if / else e switch / case

  O sketch lê o pino analógico A0 (0 a 1023) e classifica o valor em
  quatro faixas. A classificação é feita duas vezes: com if/else e com
  switch/case sobre um código de faixa, para comparar as duas formas.

  Hardware: potenciômetro de 10k entre 5V e GND, cursor em A0.
  Sem potenciômetro, o pino flutua e as leituras variam.
*/

const int PINO_POT = A0;      // A0 é o canal 0 do conversor analógico
const int LIMIAR_BAIXO = 256; // 1023 / 4
const int LIMIAR_MEDIO = 512; // 1023 / 2
const int LIMIAR_ALTO = 768;  // 3 * 1023 / 4

int leitura = 0;

// Devolve 0, 1, 2 ou 3 conforme a faixa da leitura.
int faixa(int valor) {
  if (valor < LIMIAR_BAIXO) {
    return 0;
  } else if (valor < LIMIAR_MEDIO) {
    return 1;
  } else if (valor < LIMIAR_ALTO) {
    return 2;
  } else {
    return 3;
  }
}

void setup() {
  Serial.begin(9600);
  pinMode(PINO_POT, INPUT);  // pinos analógicos também aceitam pinMode
  Serial.println("== Controle de fluxo ==");
}

void loop() {
  leitura = analogRead(PINO_POT);

  // Primeira forma: cadeia de if / else if / else.
  Serial.print("Leitura: ");
  Serial.print(leitura);
  Serial.print(" -> ");

  if (leitura < LIMIAR_BAIXO) {
    Serial.print("faixa baixa");
  } else if (leitura < LIMIAR_MEDIO) {
    Serial.print("faixa media-baixa");
  } else if (leitura < LIMIAR_ALTO) {
    Serial.print("faixa media-alta");
  } else {
    Serial.print("faixa alta");
  }

  // Segunda forma: switch sobre o código devolvido pela função.
  Serial.print(" | switch: ");
  switch (faixa(leitura)) {
    case 0:
      Serial.println("0 a 25%");
      break;
    case 1:
      Serial.println("25 a 50%");
      break;
    case 2:
      Serial.println("50 a 75%");
      break;
    case 3:
      Serial.println("75 a 100%");
      break;
    default:
      // Inalcançável com analogRead, mas todo switch deve ter um default.
      Serial.println("valor invalido");
      break;
  }

  delay(500);
}
