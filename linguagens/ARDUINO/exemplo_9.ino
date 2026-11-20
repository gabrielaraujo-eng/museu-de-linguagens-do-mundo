/*
  exemplo_9.ino - Matemática

  Funções da Language Reference usadas aqui:
    abs(), min(), max(), constrain(), map(), sq(), sqrt(), pow()
    sin(), cos()  -> recebem o ângulo em radianos
    random(), randomSeed()

  O sketch converte a leitura de A0 em tensão, limita o valor a uma
  faixa, converte para PWM e calcula uma senoide simulada.

  Hardware opcional: potenciômetro em A0 e LED no pino 9 (PWM).
*/

#define LEITURA_MAX 1023.0   // 10 bits no ATmega328P
#define TENSAO_REF 5.0       // referência padrão de 5 V
#define PWM_MAX 255

const int PINO_PWM = 9;      // pino com PWM no UNO
const float PI_APROX = 3.14159265;

void setup() {
  Serial.begin(9600);
  pinMode(PINO_PWM, OUTPUT);
  randomSeed(analogRead(A1));  // pino flutuante gera uma semente variável
  Serial.println("== Matematica ==");
}

void loop() {
  int leitura = analogRead(A0);

  // map() reescala de 0..1023 para 0..255 com aritmética inteira.
  int pwm = map(leitura, 0, 1023, 0, 255);
  analogWrite(PINO_PWM, pwm);

  // Conversão para tensão: exige float em um dos operandos.
  float tensao = leitura * (TENSAO_REF / LEITURA_MAX);

  // constrain() evita valores fora da faixa de operação do circuito.
  float tensaoSegura = constrain(tensao, 0.0, 5.0);

  // abs(), min() e max().
  float erro = abs(tensao - 2.5);
  float menor = min(tensao, tensaoSegura);
  float maior = max(tensao, tensaoSegura);

  Serial.print("A0=");
  Serial.print(leitura);
  Serial.print(" tensao=");
  Serial.print(tensao, 2);
  Serial.print(" V pwm=");
  Serial.print(pwm);
  Serial.print(" erro(2,5V)=");
  Serial.print(erro, 2);
  Serial.print(" min=");
  Serial.print(menor, 2);
  Serial.print(" max=");
  Serial.print(maior, 2);

  // sq() e sqrt().
  Serial.print(" raiz(leitura)=");
  Serial.print(sqrt((float)leitura), 2);
  Serial.print(" leitura^2=");
  Serial.print(sq((float)leitura), 0);

  // pow() devolve double; o segundo argumento é o expoente.
  Serial.print(" 2^10=");
  Serial.print(pow(2, 10), 0);

  // sin() em radianos, com o ângulo crescendo com millis().
  float angulo = (millis() % 6283) / 1000.0;  // 0 a 2*pi
  Serial.print(" sin=");
  Serial.print(sin(angulo), 3);
  Serial.print(" cos=");
  Serial.print(cos(angulo), 3);

  // random(min, max) devolve inteiro no intervalo [min, max).
  Serial.print(" aleatorio=");
  Serial.println(random(1, 100));

  delay(1000);
}
