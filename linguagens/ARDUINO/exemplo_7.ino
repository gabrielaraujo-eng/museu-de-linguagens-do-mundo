/*
  exemplo_7.ino - Tratamento de erros sem exceções

  O AVR é compilado sem suporte a exceções C++: não existe try/catch
  em um sketch. As três técnicas usadas aqui são as mesmas de qualquer
  biblioteca Arduino:

    1. código de retorno  -> a função devolve 0 em caso de sucesso
    2. valor sentinela    -> -1 indica "leitura inválida"
    3. tempo limite       -> millis() detecta um sensor que não responde

  Não é preciso hardware: a leitura é simulada e um dos casos é
  forçado a falhar para mostrar o caminho de erro.
*/

#define TIMEOUT_MS 200UL   // tempo máximo de espera por uma leitura
#define VALOR_INVALIDO -1

int contadorDeErros = 0;

// Técnica 1: devolve 0 em caso de sucesso e um código negativo em caso
// de erro, gravando o resultado em uma variável passada por referência.
int dividir(int numerador, int denominador, int &resultado) {
  if (denominador == 0) {
    return -1;  // divisão por zero: erro recuperável, não exceção
  }
  resultado = numerador / denominador;
  return 0;
}

// Técnica 2: valor sentinela. A leitura só é válida dentro de 0..1023.
int lerSensorSimulado(int indice) {
  if (indice < 0 || indice > 2) {
    return VALOR_INVALIDO;
  }
  if (indice == 1) {
    return VALOR_INVALIDO;  // sensor 1 está "desconectado"
  }
  return analogRead(A0);
}

// Técnica 3: tempo limite com millis(), sem bloquear o restante do loop.
bool aguardarPronto(unsigned long inicioEspera) {
  return (millis() - inicioEspera) <= TIMEOUT_MS;
}

void setup() {
  Serial.begin(9600);
  Serial.println("== Tratamento de erros ==");

  int resultado = 0;

  if (dividir(10, 2, resultado) == 0) {
    Serial.print("10 / 2 = ");
    Serial.println(resultado);
  } else {
    Serial.println("Erro: divisao invalida");
  }

  if (dividir(10, 0, resultado) != 0) {
    Serial.println("Erro: divisor zero detectado (codigo -1)");
    contadorDeErros++;
  }

  for (int i = -1; i <= 3; i++) {
    int leitura = lerSensorSimulado(i);
    if (leitura == VALOR_INVALIDO) {
      Serial.print("Sensor ");
      Serial.print(i);
      Serial.println(": leitura invalida (sentinela -1)");
      contadorDeErros++;
    } else {
      Serial.print("Sensor ");
      Serial.print(i);
      Serial.print(": ");
      Serial.println(leitura);
    }
  }

  unsigned long inicio = millis();
  if (!aguardarPronto(inicio)) {
    Serial.println("Erro: tempo limite excedido");
    contadorDeErros++;
  } else {
    Serial.println("Sensor respondeu dentro do tempo limite");
  }

  Serial.print("Total de erros tratados: ");
  Serial.println(contadorDeErros);
}

void loop() {
  // Verifica a cada segundo se o divisor continua válido, demonstrando
  // que o tratamento de erro pode ficar no caminho normal do programa.
  int resultado = 0;
  int divisor = (millis() / 1000) % 4;  // 0, 1, 2, 3, 0, ...

  if (dividir(100, divisor, resultado) == 0) {
    Serial.print("100 / ");
    Serial.print(divisor);
    Serial.print(" = ");
    Serial.println(resultado);
  } else {
    Serial.println("Erro recuperado: divisao por zero ignorada");
    contadorDeErros++;
  }

  delay(1000);
}
