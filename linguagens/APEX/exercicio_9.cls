/**
 * exercicio_9.cls - Geometria com Math e Decimal
 *
 * Enunciado: calcule a hipotenusa de um triângulo retângulo, a área de um
 * círculo com duas casas decimais e o valor absoluto da diferença entre as
 * duas áreas.
 *
 * Tópico: Math.sqrt, Math.pow, Math.abs e Decimal.setScale.
 * Saída esperada em Execute Anonymous (exercicio_9.executar()):
 *   Hipotenusa (3, 4): 5.0
 *   Área do círculo de raio 2: 12.57
 *   Diferença absoluta: 7.57
 */
public class exercicio_9 {

    public static Double hipotenusa(Double catetoA, Double catetoB) {
        return Math.sqrt(Math.pow(catetoA, 2) + Math.pow(catetoB, 2));
    }

    public static Decimal areaCirculo(Decimal raio) {
        Decimal pi = 3.14159;
        Decimal area = pi * raio * raio;
        return area.setScale(2);
    }

    public static void executar() {
        Double h = hipotenusa(3.0, 4.0);
        Decimal area = areaCirculo(2);

        System.debug('Hipotenusa (3, 4): ' + h);
        System.debug('Área do círculo de raio 2: ' + area);

        // A área é 12.56636 antes do arredondamento; aqui comparamos com a
        // hipotenusa convertida para Decimal.
        Decimal diferenca = area - 5;
        System.debug('Diferença absoluta: ' + Math.abs(diferenca).setScale(2));
    }
}
