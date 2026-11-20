/*
  exercicio_6.ino - Vetor de cinco leituras: inversão, maior, menor e média

  Objetivo: percorrer um vetor em duas direções, inverter os elementos
  no próprio vetor e resumir os dados com maior, menor e média.

  Hardware opcional: potenciômetro em A0. As leituras são feitas uma
  vez no setup(); sem potenciômetro o pino flutua.
*/

#define TAMANHO 5

int leituras[TAMANHO];
float media = 0.0;

void inverter(int vetor[], int tamanho) {
  // Troca as pontas e caminha para o centro; para no meio para não
  // desfazer as trocas já feitas.
  for (int i = 0; i < tamanho / 2; i++) {
    int oposto = tamanho - 1 - i;
    int temporario = vetor[i];
    vetor[i] = vetor[oposto];
    vetor[oposto] = temporario;
  }
}

void imprimir(const char *rotulo, const int vetor[], int tamanho) {
  Serial.print(rotulo);
  for (int i = 0; i < tamanho; i++) {
    Serial.print(vetor[i]);
    if (i < tamanho - 1) {
      Serial.print(", ");
    }
  }
  Serial.println();
}

int maior(const int vetor[], int tamanho) {
  int resultado = vetor[0];
  for (int i = 1; i < tamanho; i++) {
    if (vetor[i] > resultado) {
      resultado = vetor[i];
    }
  }
  return resultado;
}

int menor(const int vetor[], int tamanho) {
  int resultado = vetor[0];
  for (int i = 1; i < tamanho; i++) {
    if (vetor[i] < resultado) {
      resultado = vetor[i];
    }
  }
  return resultado;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 6: vetor de cinco leituras");

  // Coleta as cinco amostras com uma pequena pausa entre elas.
  for (int i = 0; i < TAMANHO; i++) {
    leituras[i] = analogRead(A0);
    delay(50);
  }

  imprimir("Original: ", leituras, TAMANHO);

  inverter(leituras, TAMANHO);
  imprimir("Invertido: ", leituras, TAMANHO);

  long soma = 0;
  for (int i = 0; i < TAMANHO; i++) {
    soma += leituras[i];
  }
  media = (float)soma / TAMANHO;  // float força a divisão real

  Serial.print("Maior: ");
  Serial.println(maior(leituras, TAMANHO));
  Serial.print("Menor: ");
  Serial.println(menor(leituras, TAMANHO));
  Serial.print("Media: ");
  Serial.println(media, 2);
}

void loop() {
  // Atualiza a última posição com uma leitura nova e recalcula o resumo,
  // sem inverter novamente (a inversão já foi demonstrada no setup).
  leituras[TAMANHO - 1] = analogRead(A0);

  long soma = 0;
  for (int i = 0; i < TAMANHO; i++) {
    soma += leituras[i];
  }
  media = (float)soma / TAMANHO;

  Serial.print("Nova leitura ");
  Serial.print(leituras[TAMANHO - 1]);
  Serial.print(" | maior ");
  Serial.print(maior(leituras, TAMANHO));
  Serial.print(" | menor ");
  Serial.print(menor(leituras, TAMANHO));
  Serial.print(" | media ");
  Serial.println(media, 2);

  delay(1500);
}
