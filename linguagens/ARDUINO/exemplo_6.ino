/*
  exemplo_6.ino - Estruturas de dados: vetor, matriz e struct

  O sketch mostra as três coleções que a linguagem oferece sem
  bibliotecas externas:
    vetor   -> int leituras[5]
    matriz  -> int tabela[3][4]  (linha, coluna)
    struct  -> agrupa campos de tipos diferentes em um único registro

  A matriz é usada como tabela de verdade de um decodificador de dois
  bits; a struct guarda a descrição de cada sensor simulado.

  Não é preciso hardware: as leituras são simuladas por código.
*/

#define NUM_SENSORES 3
#define LINHAS 3
#define COLUNAS 4

// Registro com campos de tipos diferentes.
struct Sensor {
  const char *nome;  // ponteiro para texto constante, sem gastar SRAM
  int pino;
  float valor;
  bool ativo;
};

// Vetor de structs, inicializado na declaração.
Sensor sensores[NUM_SENSORES] = {
  {"temperatura", A0, 21.5, true},
  {"umidade",     A1, 58.0, true},
  {"luz",         A2, 0.0,  false}
};

// Matriz: 3 linhas (estado atual) x 4 colunas (evento).
const int tabela[LINHAS][COLUNAS] = {
  {0, 1, 2, 0},
  {1, 1, 0, 2},
  {2, 0, 2, 1}
};

int leituras[5] = {10, 20, 30, 40, 50};

void setup() {
  Serial.begin(9600);
  Serial.println("== Estruturas de dados ==");

  // Percorrendo um vetor simples.
  Serial.print("Vetor de leituras:");
  int soma = 0;
  for (int i = 0; i < 5; i++) {
    Serial.print(" ");
    Serial.print(leituras[i]);
    soma += leituras[i];
  }
  Serial.print(" | soma = ");
  Serial.println(soma);

  // Percorrendo o vetor de structs por referência, para não copiar.
  for (int i = 0; i < NUM_SENSORES; i++) {
    Sensor &s = sensores[i];  // & cria uma referência ao elemento
    Serial.print(s.nome);
    Serial.print(" (pino A");
    Serial.print(s.pino - A0);
    Serial.print(") = ");
    Serial.print(s.valor, 1);
    Serial.print(" | ativo: ");
    Serial.println(s.ativo ? "sim" : "nao");
  }

  // Alterando um campo pela referência.
  sensores[2].valor = 340.0;
  sensores[2].ativo = true;
  Serial.print("Sensor de luz atualizado: ");
  Serial.println(sensores[2].valor, 1);

  // Percorrendo a matriz com dois for aninhados.
  Serial.println("Matriz 3x4:");
  for (int linha = 0; linha < LINHAS; linha++) {
    for (int coluna = 0; coluna < COLUNAS; coluna++) {
      Serial.print(tabela[linha][coluna]);
      Serial.print(" ");
    }
    Serial.println();
  }
}

void loop() {
  // Soma acumulada das leituras, deslocando o vetor a cada segundo.
  int soma = 0;
  for (int i = 0; i < 5; i++) {
    soma += leituras[i];
  }
  Serial.print("Soma atual das leituras: ");
  Serial.println(soma);

  // Desloca os valores uma posição à esquerda e descarta o primeiro.
  for (int i = 0; i < 4; i++) {
    leituras[i] = leituras[i + 1];
  }
  leituras[4] = soma % 60;  // novo valor no fim do vetor

  delay(1000);
}
