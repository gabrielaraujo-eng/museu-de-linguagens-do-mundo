/*
  exemplo_5.ino - Funções: parâmetros, retorno, valor padrão e recursão

  O sketch define quatro funções com assinaturas diferentes:
    float celsiusParaFahrenheit(float c)   -> parâmetro e retorno float
    int media(int a, int b, int c)         -> três parâmetros int
    void piscar(int pino, int vezes = 3)   -> valor padrão no parâmetro
    long fatorial(int n)                   -> recursão

  Não é preciso hardware: a saída é serial. O LED da placa (pino 13)
  é usado apenas em piscar(), como demonstração de efeito colateral.
*/

const int PINO_LED = 13;  // LED já ligado à placa no pino 13 do UNO

float celsiusParaFahrenheit(float c) {
  return c * 9.0 / 5.0 + 32.0;
}

int media(int a, int b, int c) {
  return (a + b + c) / 3;  // divisão inteira: trunca a parte fracionária
}

void piscar(int pino, int vezes = 3) {
  for (int i = 0; i < vezes; i++) {
    digitalWrite(pino, HIGH);
    delay(120);
    digitalWrite(pino, LOW);
    delay(120);
  }
}

long fatorial(int n) {
  if (n <= 1) {
    return 1;  // caso base: interrompe a recursão
  }
  return n * fatorial(n - 1);
}

void setup() {
  Serial.begin(9600);
  pinMode(PINO_LED, OUTPUT);

  Serial.println("== Funcoes ==");

  Serial.print("25 C em F: ");
  Serial.println(celsiusParaFahrenheit(25.0), 2);

  Serial.print("Media de 7, 8 e 10: ");
  Serial.println(media(7, 8, 10));

  Serial.print("Fatorial de 5: ");
  Serial.println(fatorial(5));

  Serial.print("Fatorial de 10: ");
  Serial.println(fatorial(10));

  // Chamada sem o segundo argumento usa o valor padrão (3).
  Serial.println("Piscando o LED 3 vezes (valor padrao).");
  piscar(PINO_LED);
  Serial.println("Piscando o LED 1 vez (argumento explicito).");
  piscar(PINO_LED, 1);
}

void loop() {
  // As funções já foram demonstradas em setup(); no loop apenas
  // repetimos a conversão com um valor que muda a cada 5 segundos.
  static int passo = 0;
  float celsius = 15.0 + passo * 5.0;

  Serial.print(celsius, 1);
  Serial.print(" C = ");
  Serial.print(celsiusParaFahrenheit(celsius), 1);
  Serial.println(" F");

  passo = (passo + 1) % 6;  // percorre 15, 20, 25, 30, 35, 40
  delay(5000);
}
