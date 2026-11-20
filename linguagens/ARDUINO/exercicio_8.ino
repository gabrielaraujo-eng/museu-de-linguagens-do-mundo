/*
  exercicio_8.ino - Strings: contar vogais, inverter e comparar

  Objetivo: manipular texto com a classe String e com char[]:
    contarVogais(String)  -> percorre com charAt() e length()
    inverter(String)      -> monta o resultado com concatenação
    iguais(String, String)-> comparação com ==, sem diferenciar caixa

  Não é preciso hardware.
*/

String texto = "Museu de Linguagens";

bool ehVogal(char c) {
  // Converte apenas o caractere, sem tocar na String inteira.
  if (c >= 'A' && c <= 'Z') {
    c = c - 'A' + 'a';
  }
  return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
}

int contarVogais(const String &s) {
  int total = 0;
  for (unsigned int i = 0; i < s.length(); i++) {
    if (ehVogal(s.charAt(i))) {
      total++;
    }
  }
  return total;
}

String inverter(const String &s) {
  String resultado = "";
  for (int i = (int)s.length() - 1; i >= 0; i--) {
    resultado += s.charAt(i);
  }
  return resultado;
}

bool iguais(const String &a, const String &b) {
  // toLowerCase() altera a String, por isso comparamos cópias.
  String copiaA = a;
  String copiaB = b;
  copiaA.toLowerCase();
  copiaB.toLowerCase();
  return copiaA == copiaB;
}

void setup() {
  Serial.begin(9600);
  Serial.println("Exercicio 8: strings");

  Serial.print("Texto: ");
  Serial.println(texto);

  Serial.print("Comprimento: ");
  Serial.println(texto.length());

  Serial.print("Vogais: ");
  Serial.println(contarVogais(texto));

  String invertido = inverter(texto);
  Serial.print("Invertido: ");
  Serial.println(invertido);

  Serial.print("Palindromo? ");
  Serial.println(iguais(texto, invertido) ? "sim" : "nao");

  Serial.print("'Arduino' e 'arduino' sao iguais? ");
  Serial.println(iguais("Arduino", "arduino") ? "sim" : "nao");

  // Busca de substring e substituição.
  int posicao = texto.indexOf("Linguagens");
  Serial.print("Posicao de 'Linguagens': ");
  Serial.println(posicao);

  String trocado = texto;
  trocado.replace("Linguagens", "Linguas");
  Serial.print("Com replace: ");
  Serial.println(trocado);

  // Conversão para char[] para uso em APIs que exigem string C.
  char buffer[32];
  texto.toCharArray(buffer, sizeof(buffer));
  Serial.print("Buffer C: ");
  Serial.println(buffer);
}

void loop() {
  // Verifica a cada 5 segundos se a palavra digitada (aqui fixa) é
  // palíndromo, mostrando o uso repetido das funções.
  String palavra = "arara";
  Serial.print(palavra);
  Serial.print(" invertida = ");
  Serial.print(inverter(palavra));
  Serial.print(" | vogais = ");
  Serial.print(contarVogais(palavra));
  Serial.print(" | palindromo = ");
  Serial.println(iguais(palavra, inverter(palavra)) ? "sim" : "nao");

  delay(5000);
}
