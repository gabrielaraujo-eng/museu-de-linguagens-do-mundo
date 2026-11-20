/**
 * exercicio_8.cls - Vogais e inversão de texto
 *
 * Enunciado: conte as vogais de uma frase e devolva a mesma frase invertida,
 * percorrendo a String caractere por caractere.
 *
 * Tópico: length(), substring(), toLowerCase() e laço for decrescente.
 * Saída esperada em Execute Anonymous (exercicio_8.executar()):
 *   Texto: Museu de Linguagens
 *   Vogais: 8
 *   Invertido: seguaigniL ed uesuM
 */
public class exercicio_8 {

    public static Integer contarVogais(String texto) {
        if (String.isBlank(texto)) {
            return 0;
        }
        String minusculo = texto.toLowerCase();
        Integer total = 0;
        for (Integer i = 0; i < minusculo.length(); i++) {
            String letra = minusculo.substring(i, i + 1);
            if (letra == 'a' || letra == 'e' || letra == 'i'
                || letra == 'o' || letra == 'u') {
                total++;
            }
        }
        return total;
    }

    public static String inverter(String texto) {
        String resultado = '';
        for (Integer i = texto.length() - 1; i >= 0; i--) {
            resultado += texto.substring(i, i + 1);
        }
        return resultado;
    }

    public static void executar() {
        String texto = 'Museu de Linguagens';
        System.debug('Texto: ' + texto);
        System.debug('Vogais: ' + contarVogais(texto));
        System.debug('Invertido: ' + inverter(texto));
    }
}
