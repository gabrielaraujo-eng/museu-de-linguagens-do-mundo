/*
  exercicio_10.ino - Seis notas: ordenação por seleção, mediana e busca

  Objetivo: aplicar algoritmos a um problema de avaliação:
    1. ordenar seis notas com selection sort (ordenação por seleção)
    2. calcular a mediana (média das duas centrais, pois são seis)
    3. procurar uma nota específica no vetor já ordenado

  O selection sort escolhe o menor elemento da parte não ordenada e o
  coloca na posição correta, sem trocar elementos iguais — é estável
  na prática para vetores pequenos.

  Não é preciso hardware.
*/

#define QUANTIDADE 6

float notas[QUANTIDADE] = {7.5, 4.0, 9.5, 6.0, 8.5, 5.5};

void ordenarPorSelecao(float vetor[], int tamanho) {
  for (int i = 0; i < tamanho - 1; i++) {
    int indiceMenor = i;

    // Procura o menor elemento do trecho ainda não ordenado.
    for (int j = i + 1; j < tamanho; j++) {
      if (vetor[j] < vetor[indiceMenor]) {
        indiceMenor = j;
      }
    }

    // Troca uma única vez por passe, se necessário.
    if (indiceMenor != i) {
      float temporario = vetor[i];
      vetor[i] = vetor[indiceMenor];
      vetor[indiceMenor] = temporario;
    }
  }
}

float mediana(const float vetor[], int tamanho) {
  if (tamanho % 2 == 1) {
    return vetor[tamanho / 2];  // quantidade ímpar: elemento central
  }
  // Quantidade par: média dos dois elementos centrais.
  return (vetor[tamanho / 2 - 1] + vetor[tamanho / 2]) / 2.0;
}

int buscar(const float vetor[], int tamanho, float alvo) {
  for (int i = 0; i < tamanho; i++) {
    // Comparação de float com tolerância, já que igualdade exata é frágil.
    if (abs(vetor[i] - alvo) < 0.001) {
      return i;
    }
  }
  return -1;
}

void imprimir(const char *rotulo, const float vetor[], int tamanho) {
  Serial.print(rotulo);
  for (int i = 0; i < tamanho; i++) {
    Serial.print(vetor[i], 1);
    if (i < tamanho - 1) {
      Serial.print(" | ");
    }
  }
  Serial.println();
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 10: notas, mediana e busca");

  imprimir("Notas:    ", notas, QUANTIDADE);

  ordenarPorSelecao(notas, QUANTIDADE);
  imprimir("Ordenadas:", notas, QUANTIDADE);

  float central = mediana(notas, QUANTIDADE);
  Serial.print("Mediana: ");
  Serial.println(central, 2);

  float soma = 0.0;
  for (int i = 0; i < QUANTIDADE; i++) {
    soma += notas[i];
  }
  Serial.print("Media:   ");
  Serial.println(soma / QUANTIDADE, 2);

  float procurada = 8.5;
  int posicao = buscar(notas, QUANTIDADE, procurada);
  Serial.print("Nota ");
  Serial.print(procurada, 1);
  if (posicao >= 0) {
    Serial.print(" encontrada na posicao ");
    Serial.println(posicao);
  } else {
    Serial.println(" nao encontrada");
  }
}

void loop() {
  // A cada 10 segundos registra uma nota nova no lugar da menor e
  // reordena, mostrando que o algoritmo se mantém correto com mudanças.
  static int passo = 0;
  float novaNota = 3.0 + passo * 1.5;  // 3.0, 4.5, 6.0, ...

  notas[0] = novaNota;
  ordenarPorSelecao(notas, QUANTIDADE);

  Serial.print("Nova nota ");
  Serial.print(novaNota, 1);
  Serial.print(" | mediana ");
  Serial.print(mediana(notas, QUANTIDADE), 2);
  Serial.print(" | vetor: ");
  imprimir("", notas, QUANTIDADE);

  passo = (passo + 1) % 5;
  delay(10000);
}
