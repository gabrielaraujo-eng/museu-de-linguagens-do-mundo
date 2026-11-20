/*
  exercicio_2.ino - Tabela de conversão de Celsius para Fahrenheit

  Objetivo: praticar float, constantes com #define e formatação de
  saída com Serial.print(valor, casas).

  A fórmula é F = C * 9 / 5 + 32. Escrever 9.0 / 5.0 (e não 9 / 5)
  é essencial: a divisão inteira de 9 por 5 resultaria em 1.

  Não é preciso hardware.
*/

#define C_INICIAL -10
#define C_FINAL 40
#define PASSO 5

float paraFahrenheit(float celsius) {
  return celsius * 9.0 / 5.0 + 32.0;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 2: Celsius -> Fahrenheit");
  Serial.println("Celsius | Fahrenheit");

  for (int c = C_INICIAL; c <= C_FINAL; c += PASSO) {
    float fahrenheit = paraFahrenheit((float)c);

    // Alinhamento simples para a tabela ficar legível no monitor serial.
    if (c < 0) {
      Serial.print(" ");
    } else {
      Serial.print("  ");
    }
    Serial.print(c);
    Serial.print("    | ");
    Serial.println(fahrenheit, 1);
  }

  // Comparação entre divisão inteira e real, o erro clássico do tópico.
  Serial.print("9 / 5 inteiro = ");
  Serial.println(9 / 5);
  Serial.print("9.0 / 5.0 real = ");
  Serial.println(9.0 / 5.0, 2);
}

void loop() {
  // Mantém o último valor calculado visível, recalculando a cada 10 s.
  float exemplo = 36.5;
  Serial.print("Temperatura corporal ");
  Serial.print(exemplo, 1);
  Serial.print(" C = ");
  Serial.print(paraFahrenheit(exemplo), 1);
  Serial.println(" F");
  delay(10000);
}
