/*
  exemplo_1.ino - Estrutura mínima de um sketch Arduino

  Todo sketch tem duas funções que o núcleo chama:
    setup() -> executada uma única vez, após o reset
    loop()  -> executada em sequência infinita, logo depois de setup()

  Aqui a saída é apenas a porta serial, então não é preciso nenhum
  componente externo: basta abrir o Monitor Serial a 9600 bauds.
*/

#define BAUDRATE 9600        // velocidade da porta serial, em bits por segundo
#define INTERVALO 1000UL     // 1000 ms entre mensagens (UL = unsigned long)

unsigned long ultimaMensagem = 0;  // instante da última mensagem enviada
unsigned int contador = 0;         // quantas mensagens já foram enviadas

void setup() {
  Serial.begin(BAUDRATE);            // inicializa a UART do ATmega328P
  Serial.println("Ola, Mundo!");     // primeira mensagem, uma única vez
  Serial.println("Sketch iniciado: setup() concluido.");
}

void loop() {
  // millis() devolve o tempo desde o reset. Comparar por diferença evita
  // o problema do estouro do contador a cada ~49 dias.
  if (millis() - ultimaMensagem >= INTERVALO) {
    ultimaMensagem = millis();
    contador++;

    Serial.print("loop() executado ");
    Serial.print(contador);
    Serial.print(" vez(es) em ");
    Serial.print(millis() / 1000);
    Serial.println(" s de funcionamento.");
  }
}
