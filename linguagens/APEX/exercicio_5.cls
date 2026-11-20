/**
 * exercicio_5.cls - Potência inteira
 *
 * Enunciado: calcule base elevada a expoente inteiro não negativo, em duas
 * versões: recursiva e iterativa. Compare os resultados.
 *
 * Tópico: recursão, laço for, Long para evitar estouro de Integer.
 * Saída esperada em Execute Anonymous (exercicio_5.executar()):
 *   2^10 = 1024 (recursivo) / 1024 (iterativo)
 *   3^5 = 243 (recursivo) / 243 (iterativo)
 *   5^0 = 1 (recursivo) / 1 (iterativo)
 */
public class exercicio_5 {

    public static Long potenciaRecursiva(Long base, Integer expoente) {
        if (expoente < 0) {
            throw new IllegalArgumentException('O expoente deve ser maior ou igual a zero.');
        }
        if (expoente == 0) {
            return 1;
        }
        return base * potenciaRecursiva(base, expoente - 1);
    }

    public static Long potenciaIterativa(Long base, Integer expoente) {
        if (expoente < 0) {
            throw new IllegalArgumentException('O expoente deve ser maior ou igual a zero.');
        }
        Long resultado = 1;
        for (Integer i = 0; i < expoente; i++) {
            resultado *= base;
        }
        return resultado;
    }

    public static void executar() {
        System.debug('2^10 = ' + potenciaRecursiva(2, 10) + ' (recursivo) / '
            + potenciaIterativa(2, 10) + ' (iterativo)');
        System.debug('3^5 = ' + potenciaRecursiva(3, 5) + ' (recursivo) / '
            + potenciaIterativa(3, 5) + ' (iterativo)');
        System.debug('5^0 = ' + potenciaRecursiva(5, 0) + ' (recursivo) / '
            + potenciaIterativa(5, 0) + ' (iterativo)');
    }
}
