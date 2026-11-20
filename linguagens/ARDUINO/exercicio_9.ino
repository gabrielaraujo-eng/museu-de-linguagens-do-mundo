/*
  exercicio_9.ino - Hipotenusa, área do círculo e conversão de ADC

  Objetivo: aplicar sqrt(), pow() e map() a problemas de geometria e
  de instrumentação:
    hipotenusa(a, b) = sqrt(a*a + b*b)
    areaCirculo(r)   = pi * r^2
    tensao(leitura)  = leitura * 5.0 / 1023

  Hardware opcional: potenciômetro em A0.
*/

#define LEITURA_MAX 1023.0
#define TENSAO_REF 5.0
#define PI_APROX 3.14159265

float hipotenusa(float a, float b) {
  return sqrt(a * a + b * b);
}

float areaCirculo(float raio) {
  return PI_APROX * raio * raio;
}

// Converte a leitura do ADC em tensão, limitando a 0..5 V.
float tensaoDe(int leitura) {
  int limitada = constrain(leitura, 0, 1023);
  return limitada * (TENSAO_REF / LEITURA_MAX);
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 9: geometria e ADC");

  float catetoA = 3.0;
  float catetoB = 4.0;
  Serial.print("Hipotenusa de ");
  Serial.print(catetoA, 1);
  Serial.print(" e ");
  Serial.print(catetoB, 1);
  Serial.print(" = ");
  Serial.println(hipotenusa(catetoA, catetoB), 2);  // 5.00

  Serial.print("Area do circulo de raio 2.5 = ");
  Serial.println(areaCirculo(2.5), 2);

  // map() converte a leitura em percentual de 0 a 100.
  int leitura = analogRead(A0);
  int percentual = map(leitura, 0, 1023, 0, 100);

  Serial.print("Leitura A0 = ");
  Serial.print(leitura);
  Serial.print(" | ");
  Serial.print(percentual);
  Serial.print("% | ");
  Serial.print(tensaoDe(leitura), 2);
  Serial.println(" V");

  // Potência e raiz como comparação: 2^8 = 256 e sqrt(256) = 16.
  Serial.print("2^8 = ");
  Serial.print(pow(2, 8), 0);
  Serial.print(" e sqrt(256) = ");
  Serial.println(sqrt(256.0), 0);
}

void loop() {
  // Mede a tensão a cada 2 segundos e calcula a potência dissipada
  // em um resistor de 100 ohms: P = V^2 / R.
  int leitura = analogRead(A0);
  float tensao = tensaoDe(leitura);
  float potencia = (tensao * tensao) / 100.0;

  Serial.print("V = ");
  Serial.print(tensao, 3);
  Serial.print(" V | P(100 ohms) = ");
  Serial.print(potencia, 4);
  Serial.print(" W | raio equivalente = ");
  Serial.println(sqrt(areaCirculo(1.0) + tensao), 3);

  delay(2000);
}
