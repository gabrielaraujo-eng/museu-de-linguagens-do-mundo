/**
 * exercicio_4.cls - Soma dos números pares
 *
 * Enunciado: calcule a soma dos números pares de 1 a 100 com um laço for e
 * conte quantos ímpares existem no mesmo intervalo com um laço while.
 *
 * Tópico: for com continue, while com contador e Math.mod.
 * Saída esperada em Execute Anonymous (exercicio_4.executar()):
 *   Soma dos pares de 1 a 100: 2550
 *   Quantidade de ímpares de 1 a 100: 50
 */
public class exercicio_4 {

    public static Integer somaPares(Integer limite) {
        Integer soma = 0;
        for (Integer i = 1; i <= limite; i++) {
            if (Math.mod(i, 2) != 0) {
                continue; // ignora os ímpares
            }
            soma += i;
        }
        return soma;
    }

    public static Integer contaImpares(Integer limite) {
        Integer quantidade = 0;
        Integer i = 1;
        while (i <= limite) {
            if (Math.mod(i, 2) == 1) {
                quantidade++;
            }
            i++;
        }
        return quantidade;
    }

    public static void executar() {
        System.debug('Soma dos pares de 1 a 100: ' + somaPares(100));
        System.debug('Quantidade de ímpares de 1 a 100: ' + contaImpares(100));
    }
}
