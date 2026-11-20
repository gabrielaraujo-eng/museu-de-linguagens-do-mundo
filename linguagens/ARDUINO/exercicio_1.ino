/*
  exercicio_1.ino - Dois LEDs alternados (estrutura básica e saída digital)

  Objetivo: usar setup() para configurar os pinos e loop() para alternar
  dois LEDs, sem bloquear o programa com delay().

  Hardware: LED vermelho no pino 6 e LED verde no pino 7, cada um com
  resistor de 220 a 330 ohms em série com o GND.
*/

#define PINO_VERMELHO 6
#define PINO_VERDE 7
#define TROCA_MS 500UL

unsigned long instanteDaTroca = 0;
bool vermelhoAceso = false;
unsigned int trocas = 0;

void setup() {
  Serial.begin(9600);

  pinMode(PINO_VERMELHO, OUTPUT);
  pinMode(PINO_VERDE, OUTPUT);

  // Estado inicial: vermelho aceso, verde apagado.
  digitalWrite(PINO_VERMELHO, HIGH);
  digitalWrite(PINO_VERDE, LOW);
  vermelhoAceso = true;

  Serial.println("Exercicio 1: LEDs alternados");
  Serial.println("Vermelho (pino 6) e verde (pino 7) trocam a cada 500 ms.");
}

void loop() {
  if (millis() - instanteDaTroca >= TROCA_MS) {
    instanteDaTroca = millis();
    trocas++;

    vermelhoAceso = !vermelhoAceso;
    digitalWrite(PINO_VERMELHO, vermelhoAceso ? HIGH : LOW);
    digitalWrite(PINO_VERDE, vermelhoAceso ? LOW : HIGH);

    Serial.print("Troca ");
    Serial.print(trocas);
    Serial.print(": ");
    Serial.println(vermelhoAceso ? "vermelho aceso" : "verde aceso");
  }
}
