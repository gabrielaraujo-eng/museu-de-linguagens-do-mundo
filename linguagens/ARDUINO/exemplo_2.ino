/*
  exemplo_2.ino - Variáveis e tipos de dados

  Tipos usados neste sketch e seus tamanhos no ATmega328P (AVR, 8 bits):
    int           -> 2 bytes, de -32768 a 32767
    long          -> 4 bytes, de -2147483648 a 2147483647
    unsigned long -> 4 bytes, de 0 a 4294967295
    float         -> 4 bytes, cerca de 7 dígitos significativos
    bool          -> 1 byte, true ou false
    char          -> 1 byte, um caractere ASCII
    String        -> objeto da biblioteca do Arduino, ocupa SRAM

  O sketch imprime os valores e o tamanho de cada tipo com sizeof().
*/

int temperatura = 23;              // inteiro com sinal
long distanciaKm = 384400L;        // L força a constante a ser long
unsigned long segundosLigado = 0;  // nunca negativo: ideal para contadores
float tensao = 4.87;               // ponto flutuante
bool sensorPronto = true;          // booleano
char inicial = 'A';                // caractere entre aspas simples
String nome = "Arduino Uno";       // texto entre aspas duplas

void setup() {
  Serial.begin(9600);
  Serial.println("== Variaveis e tipos ==");

  Serial.print("temperatura (int): ");
  Serial.print(temperatura);
  Serial.print(" -> sizeof = ");
  Serial.print(sizeof(temperatura));
  Serial.println(" byte(s)");

  Serial.print("distanciaKm (long): ");
  Serial.print(distanciaKm);
  Serial.print(" -> sizeof = ");
  Serial.print(sizeof(distanciaKm));
  Serial.println(" byte(s)");

  Serial.print("tensao (float): ");
  Serial.print(tensao, 2);  // 2 casas decimais
  Serial.print(" V -> sizeof = ");
  Serial.print(sizeof(tensao));
  Serial.println(" byte(s)");

  Serial.print("sensorPronto (bool): ");
  Serial.print(sensorPronto);
  Serial.print(" -> sizeof = ");
  Serial.print(sizeof(sensorPronto));
  Serial.println(" byte(s)");

  Serial.print("inicial (char): ");
  Serial.print(inicial);
  Serial.print(" -> sizeof = ");
  Serial.print(sizeof(inicial));
  Serial.println(" byte(s)");

  Serial.print("nome (String): ");
  Serial.print(nome);
  Serial.print(" -> length() = ");
  Serial.println(nome.length());

  // Aritmética entre tipos: a divisão de int por int trunca o resultado,
  // por isso um dos operandos é convertido para float.
  int soma = 7;
  int partes = 2;
  Serial.print("7 / 2 como int = ");
  Serial.println(soma / partes);
  Serial.print("7 / 2 como float = ");
  Serial.println((float)soma / partes, 2);
}

void loop() {
  segundosLigado = millis() / 1000UL;
  temperatura = 20 + (int)(segundosLigado % 8);  // varia de 20 a 27
  delay(2000);
}
