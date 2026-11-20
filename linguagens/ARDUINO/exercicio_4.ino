/*
  exercicio_4.ino - Contagem regressiva com for, while e do...while

  Objetivo: resolver a mesma tarefa com os três laços, comparando
  quando cada um é mais adequado:
    for       -> número de repetições conhecido (5 até 1)
    while     -> repete enquanto a condição for verdadeira
    do...while-> executa ao menos uma vez, testando no fim

  Hardware opcional: LED no pino 9, que pisca durante a contagem.
*/

#define PINO_LED 9
#define INICIO 5

void setup() {
  Serial.begin(9600);
  pinMode(PINO_LED, OUTPUT);
  Serial.println("Exercicio 4: contagem regressiva");

  // 1) for com decremento.
  Serial.print("for:      ");
  for (int i = INICIO; i >= 1; i--) {
    Serial.print(i);
    Serial.print(" ");
  }
  Serial.println("decolar!");

  // 2) while com variável de controle declarada antes.
  Serial.print("while:    ");
  int contador = INICIO;
  while (contador >= 1) {
    Serial.print(contador);
    Serial.print(" ");
    contador--;
  }
  Serial.println("decolar!");

  // 3) do...while: o corpo roda antes do primeiro teste.
  Serial.print("do...while: ");
  int outro = INICIO;
  do {
    Serial.print(outro);
    Serial.print(" ");
    outro--;
  } while (outro >= 1);
  Serial.println("decolar!");
}

void loop() {
  // Repete a contagem física: um piscar por segundo, um por número.
  for (int i = INICIO; i >= 1; i--) {
    Serial.print("T-");
    Serial.print(i);
    Serial.println(" s");

    digitalWrite(PINO_LED, HIGH);
    delay(500);
    digitalWrite(PINO_LED, LOW);
    delay(500);
  }

  Serial.println("Lancamento!");
  delay(3000);
}
