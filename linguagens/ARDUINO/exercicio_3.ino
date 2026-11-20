/*
  exercicio_3.ino - Classificação de uma leitura analógica em faixas

  Objetivo: combinar if/else para a decisão e switch/case para escolher
  a mensagem, além de acender um LED de alerta quando a leitura passa
  de um limite.

  Hardware: potenciômetro em A0 (cursor), LED no pino 8 com resistor.
  Sem potenciômetro o pino flutua e a classificação varia.
*/

#define PINO_LEITURA A0
#define PINO_ALERTA 8

#define NIVEL_BAIXO 300
#define NIVEL_MEDIO 600
#define NIVEL_ALTO 850

// Devolve 1, 2, 3 ou 4 para a faixa da leitura.
int classificar(int valor) {
  if (valor < NIVEL_BAIXO) {
    return 1;
  } else if (valor < NIVEL_MEDIO) {
    return 2;
  } else if (valor < NIVEL_ALTO) {
    return 3;
  } else {
    return 4;
  }
}

void setup() {
  Serial.begin(9600);
  pinMode(PINO_LEITURA, INPUT);
  pinMode(PINO_ALERTA, OUTPUT);
  digitalWrite(PINO_ALERTA, LOW);
  Serial.println("Exercicio 3: classificacao de faixas");
}

void loop() {
  int valor = analogRead(PINO_LEITURA);
  int nivel = classificar(valor);

  Serial.print("Valor ");
  Serial.print(valor);
  Serial.print(" -> nivel ");

  switch (nivel) {
    case 1:
      Serial.print("muito baixo");
      break;
    case 2:
      Serial.print("baixo");
      break;
    case 3:
      Serial.print("medio");
      break;
    case 4:
      Serial.print("alto");
      break;
    default:
      Serial.print("indefinido");
      break;
  }

  // O LED de alerta liga apenas na faixa mais alta.
  bool alerta = (nivel == 4);
  digitalWrite(PINO_ALERTA, alerta ? HIGH : LOW);

  if (alerta) {
    Serial.println(" | LED de alerta LIGADO");
  } else {
    Serial.println(" | LED de alerta desligado");
  }

  delay(400);
}
