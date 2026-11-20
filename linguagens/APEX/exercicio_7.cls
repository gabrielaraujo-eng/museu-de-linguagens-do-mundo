/**
 * exercicio_7.cls - Divisão protegida
 *
 * Enunciado: implemente uma divisão que recuse divisor zero lançando uma
 * exceção própria, e trate o erro no chamador sem interromper o programa.
 *
 * Tópico: exceção personalizada, throw, try / catch / finally.
 * Saída esperada em Execute Anonymous (exercicio_7.executar()):
 *   10 / 4 = 2.5
 *   Erro: o divisor não pode ser zero.
 *   Cálculos encerrados.
 */
public class exercicio_7 {

    public class DivisaoPorZeroException extends Exception {}

    public static Decimal dividir(Decimal dividendo, Decimal divisor) {
        if (divisor == 0) {
            throw new DivisaoPorZeroException('o divisor não pode ser zero.');
        }
        return dividendo / divisor;
    }

    public static void executar() {
        try {
            System.debug('10 / 4 = ' + dividir(10, 4));
            System.debug('10 / 0 = ' + dividir(10, 0)); // lança a exceção
            System.debug('Esta linha não é executada.');
        } catch (DivisaoPorZeroException e) {
            System.debug('Erro: ' + e.getMessage());
        } finally {
            System.debug('Cálculos encerrados.');
        }
    }
}
