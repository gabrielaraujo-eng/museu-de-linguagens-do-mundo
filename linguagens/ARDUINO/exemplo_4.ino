/*
  exemplo_4.ino - Laços de repetição: for, while e do...while

  O sketch acende quatro LEDs em sequência, um de cada vez, e usa cada
  tipo de laço em uma etapa diferente:
    for       -> percorre o vetor de pinos
    while     -> espera o tempo de cada passo sem sair do laço
    do...while-> repete a sequência até completar um ciclo

  Hardware: LEDs nos pinos digitais 2, 3, 4 e 5, cada um com resistor
  de 220 a 330 ohms em série com o GND.
*/

const int PINOS[] = {2, 3, 4, 5};    // pinos dos LEDs
const int QUANTOS = 4;               // tamanho do vetor
const unsigned long PASSO_MS = 200;  // duração de cada LED aceso
const int CICLOS = 3;                // quantas sequências completas

void setup() {
  Serial.begin(9600);

  // for clássico: inicialização, condição e incremento em uma linha.
  for (int i = 0; i < QUANTOS; i++) {
    pinMode(PINOS[i], OUTPUT);
    digitalWrite(PINOS[i], LOW);
  }

  Serial.println("== Lacos de repeticao ==");
  Serial.print("Pinos configurados: ");
  Serial.println(QUANTOS);
}

// Acende apenas o LED de índice "aceso" e apaga os demais.
// O índice -1 apaga todos.
void acenderApenas(int aceso) {
  for (int i = 0; i < QUANTOS; i++) {
    digitalWrite(PINOS[i], (i == aceso) ? HIGH : LOW);
  }
}

void loop() {
  int ciclo = 0;

  // do...while executa o corpo pelo menos uma vez antes de testar.
  do {
    Serial.print("Ciclo ");
    Serial.println(ciclo + 1);

    // for percorre os LEDs da esquerda para a direita.
    for (int i = 0; i < QUANTOS; i++) {
      acenderApenas(i);

      // while espera o passo inteiro, consultando millis() a cada volta.
      unsigned long inicio = millis();
      while (millis() - inicio < PASSO_MS) {
        // Nada a fazer: apenas aguarda, sem bloquear com delay().
      }
    }

    ciclo++;
  } while (ciclo < CICLOS);

  // Apaga tudo e faz uma pausa antes de repetir a sequência.
  acenderApenas(-1);
  Serial.println("Sequencia concluida, reiniciando.");
  delay(1000);
}
