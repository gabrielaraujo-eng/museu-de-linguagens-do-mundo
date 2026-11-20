/*
  exemplo_10.ino - Algoritmos: ordenação por trocas e busca binária

  Dois algoritmos clássicos implementados sobre um vetor de inteiros:

    bubble sort   -> compara pares vizinhos e troca quando estão fora
                     de ordem; O(n^2), mas simples e estável
    busca binária -> exige o vetor ordenado; descarta metade a cada
                     passo; O(log n)

  O sketch ordena um vetor de leituras simuladas e procura um valor
  informado pela constante ALVO.

  Não é preciso hardware.
*/

#define TAMANHO 8
#define ALVO 42

int dados[TAMANHO] = {42, 7, 19, 3, 88, 15, 60, 31};

// Troca dois inteiros por referência, sem usar variável global.
void trocar(int &a, int &b) {
  int temporario = a;
  a = b;
  b = temporario;
}

// Ordena em ordem crescente, empurrando o maior para o fim a cada passe.
void ordenarPorTrocas(int vetor[], int tamanho) {
  for (int passe = 0; passe < tamanho - 1; passe++) {
    bool houveTroca = false;

    for (int i = 0; i < tamanho - 1 - passe; i++) {
      if (vetor[i] > vetor[i + 1]) {
        trocar(vetor[i], vetor[i + 1]);
        houveTroca = true;
      }
    }

    // Se nenhuma troca ocorreu, o vetor já está ordenado.
    if (!houveTroca) {
      break;
    }
  }
}

// Devolve o índice do valor ou -1 se ele não existir no vetor.
int buscaBinaria(const int vetor[], int tamanho, int alvo) {
  int inicio = 0;
  int fim = tamanho - 1;

  while (inicio <= fim) {
    int meio = inicio + (fim - inicio) / 2;  // evita estouro da soma

    if (vetor[meio] == alvo) {
      return meio;
    } else if (vetor[meio] < alvo) {
      inicio = meio + 1;  // o alvo está na metade direita
    } else {
      fim = meio - 1;     // o alvo está na metade esquerda
    }
  }

  return -1;  // não encontrado
}

void imprimir(const int vetor[], int tamanho) {
  for (int i = 0; i < tamanho; i++) {
    Serial.print(vetor[i]);
    if (i < tamanho - 1) {
      Serial.print(" ");
    }
  }
  Serial.println();
}

void setup() {
  Serial.begin(9600);
  Serial.println("== Algoritmos ==");

  Serial.print("Antes:  ");
  imprimir(dados, TAMANHO);

  ordenarPorTrocas(dados, TAMANHO);

  Serial.print("Depois: ");
  imprimir(dados, TAMANHO);

  int posicao = buscaBinaria(dados, TAMANHO, ALVO);
  Serial.print("Busca por ");
  Serial.print(ALVO);
  if (posicao >= 0) {
    Serial.print(": encontrado no indice ");
    Serial.println(posicao);
  } else {
    Serial.println(": nao encontrado");
  }

  int ausente = buscaBinaria(dados, TAMANHO, 100);
  Serial.print("Busca por 100: ");
  Serial.println(ausente == -1 ? "nao encontrado (-1)" : "encontrado");
}

void loop() {
  // A cada 5 segundos insere um novo valor aleatório e reordena o vetor,
  // mostrando que o algoritmo funciona com dados que mudam.
  int novoValor = random(0, 100);
  dados[TAMANHO - 1] = novoValor;

  ordenarPorTrocas(dados, TAMANHO);

  Serial.print("Novo valor ");
  Serial.print(novoValor);
  Serial.print(" | vetor: ");
  imprimir(dados, TAMANHO);

  delay(5000);
}
