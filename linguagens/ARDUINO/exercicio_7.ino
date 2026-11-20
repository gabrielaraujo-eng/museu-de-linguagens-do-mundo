/*
  exercicio_7.ino - Divisão protegida e leitura com tempo limite

  Objetivo: tratar duas falhas comuns sem exceções:
    1. divisor zero em um cálculo de média
    2. sensor que não responde dentro de um tempo limite

  O padrão usado é o mesmo das bibliotecas Arduino: a função devolve
  um código de erro e o chamador decide o que fazer. Os códigos ficam
  em uma enumeração, que dá nome aos números.

  Não é preciso hardware.
*/

#define TEMPO_LIMITE_MS 250UL

// Códigos de erro nomeados; 0 significa sucesso.
enum CodigoErro {
  OK = 0,
  ERRO_DIVISOR_ZERO = -1,
  ERRO_LEITURA = -2,
  ERRO_TEMPO_LIMITE = -3
};

int erros = 0;

// Calcula a média de um vetor; devolve o código de erro e grava o
// resultado em "saida".
CodigoErro calcularMedia(const int valores[], int quantidade, float &saida) {
  if (quantidade <= 0) {
    return ERRO_DIVISOR_ZERO;
  }

  long soma = 0;
  for (int i = 0; i < quantidade; i++) {
    if (valores[i] < 0) {
      return ERRO_LEITURA;  // valor negativo é impossível em um ADC
    }
    soma += valores[i];
  }

  saida = (float)soma / quantidade;
  return OK;
}

// Simula um sensor: devolve false quando o índice é inválido ou quando
// o tempo de espera já passou.
bool lerSensor(int indice, int &valor, unsigned long inicio) {
  if (indice < 0 || indice > 3) {
    return false;
  }
  if (millis() - inicio > TEMPO_LIMITE_MS) {
    return false;  // o sensor demorou demais para responder
  }

  valor = 100 + indice * 50;  // resposta simulada e determinística
  return true;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 7: erros com codigo de retorno");

  int amostras[4] = {512, 480, 530, 498};
  float media = 0.0;

  CodigoErro codigo = calcularMedia(amostras, 4, media);
  if (codigo == OK) {
    Serial.print("Media das 4 amostras: ");
    Serial.println(media, 1);
  } else {
    Serial.print("Falha ao calcular a media, codigo ");
    Serial.println((int)codigo);
    erros++;
  }

  // Vetor vazio: divisor zero.
  codigo = calcularMedia(amostras, 0, media);
  if (codigo != OK) {
    Serial.print("Vetor vazio rejeitado, codigo ");
    Serial.println((int)codigo);
    erros++;
  }

  // Vetor com valor inválido.
  int invalidas[3] = {100, -5, 200};
  codigo = calcularMedia(invalidas, 3, media);
  if (codigo != OK) {
    Serial.print("Valor negativo rejeitado, codigo ");
    Serial.println((int)codigo);
    erros++;
  }

  // Leitura com tempo limite.
  unsigned long inicio = millis();
  int valor = 0;
  if (lerSensor(2, valor, inicio)) {
    Serial.print("Sensor 2 respondeu: ");
    Serial.println(valor);
  } else {
    Serial.print("Sensor 2 falhou, codigo ");
    Serial.println((int)ERRO_TEMPO_LIMITE);
    erros++;
  }

  if (!lerSensor(9, valor, inicio)) {
    Serial.print("Indice 9 invalido, codigo ");
    Serial.println((int)ERRO_LEITURA);
    erros++;
  }

  Serial.print("Total de erros tratados: ");
  Serial.println(erros);
}

void loop() {
  // A cada 3 segundos tenta uma leitura com um índice que alterna entre
  // válido e inválido, sempre sem interromper o programa.
  static int indice = 0;
  int valor = 0;
  unsigned long inicio = millis();

  if (lerSensor(indice, valor, inicio)) {
    Serial.print("Leitura valida do sensor ");
    Serial.print(indice);
    Serial.print(": ");
    Serial.println(valor);
  } else {
    Serial.print("Leitura recusada para o indice ");
    Serial.println(indice);
    erros++;
  }

  indice = (indice + 1) % 6;  // 0..5, e 4 e 5 são inválidos
  delay(3000);
}
