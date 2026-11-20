/*
  exemplo_8.ino - Manipulação de strings com a classe String

  A classe String do Arduino é documentada na Language Reference e
  oferece concatenação com +, length(), charAt(), substring(),
  indexOf(), replace(), toUpperCase() e toCharArray().

  Atenção: cada String ocupa SRAM (o UNO tem apenas 2 KB). Para textos
  fixos, prefira char[] e a macro F(), que mantêm o texto na memória
  de programa.

  Não é preciso hardware.
*/

String saudacao = "Ola";
String assunto = "Arduino";

void setup() {
  Serial.begin(9600);
  Serial.println("== Strings ==");

  // Concatenação com + e com +=.
  String mensagem = saudacao + ", " + assunto + "!";
  Serial.print("Mensagem: ");
  Serial.println(mensagem);

  Serial.print("Comprimento: ");
  Serial.println(mensagem.length());

  Serial.print("Primeiro caractere: ");
  Serial.println(mensagem.charAt(0));

  // substring(inicio, fim) vai do índice inicial até fim - 1.
  Serial.print("Primeiros 5 caracteres: ");
  Serial.println(mensagem.substring(0, 5));

  // indexOf devolve a posição ou -1 quando não encontra.
  int posicao = mensagem.indexOf("Arduino");
  Serial.print("Posicao de 'Arduino': ");
  Serial.println(posicao);

  // replace altera a própria String e devolve a referência.
  String copia = mensagem;
  copia.replace("Arduino", "UNO");
  Serial.print("Depois de replace: ");
  Serial.println(copia);

  // toUpperCase e toLowerCase alteram no lugar.
  String maiuscula = mensagem;
  maiuscula.toUpperCase();
  Serial.print("Maiusculas: ");
  Serial.println(maiuscula);

  // Comparação: use == entre Strings, nunca compare com strcmp.
  Serial.print("mensagem == copia? ");
  Serial.println(mensagem == copia ? "sim" : "nao");
  Serial.print("mensagem == 'Ola, Arduino!'? ");
  Serial.println(mensagem == "Ola, Arduino!" ? "sim" : "nao");

  // Conversão para vetor de char, útil para bibliotecas que exigem C.
  char buffer[32];
  mensagem.toCharArray(buffer, sizeof(buffer));
  Serial.print("Buffer C: ");
  Serial.println(buffer);

  // Números convertidos em texto.
  String leitura = "A0 = " + String(analogRead(A0));
  Serial.println(leitura);
}

void loop() {
  // Monta uma linha de relatório a cada 2 segundos.
  static unsigned int amostra = 0;
  amostra++;

  String linha = "amostra " + String(amostra) + " | A0=" + String(analogRead(A0));
  Serial.println(linha);

  delay(2000);
}
