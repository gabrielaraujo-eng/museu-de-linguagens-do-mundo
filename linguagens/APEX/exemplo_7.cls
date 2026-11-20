/**
 * exemplo_7.cls - Tratamento de erros
 *
 * Tópico: try / catch / finally, exceção personalizada (uma classe interna
 * que estende Exception) e captura de exceções de sistema, como MathException
 * (divisão por zero) e DmlException.
 *
 * Execute Anonymous: exemplo_7.executar();
 */
public class exemplo_7 {

    /** Exceção de negócio: o nome termina em Exception por convenção. */
    public class SaldoInsuficienteException extends Exception {}

    public static void sacar(Decimal saldo, Decimal valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException('O valor do saque deve ser positivo.');
        }
        if (valor > saldo) {
            throw new SaldoInsuficienteException(
                'Saldo insuficiente: faltam ' + (valor - saldo)
            );
        }
        System.debug('Saque de ' + valor + ' autorizado. Saldo: ' + (saldo - valor));
    }

    public static void executar() {
        // 1) Caminho feliz e caminho de erro no mesmo try.
        try {
            sacar(100, 30);
            sacar(100, 250);
            System.debug('Esta linha não é alcançada.');
        } catch (SaldoInsuficienteException e) {
            System.debug('Erro de negócio: ' + e.getMessage());
        } catch (Exception e) {
            System.debug('Erro inesperado: ' + e.getMessage());
        } finally {
            System.debug('finally: sempre executa, com ou sem exceção.');
        }

        // 2) Exceção de sistema: divisão por zero lança MathException.
        try {
            Decimal zero = 0;
            Decimal resultado = 10 / zero;
            System.debug('Resultado: ' + resultado);
        } catch (MathException e) {
            System.debug('Divisão por zero capturada: ' + e.getMessage());
        }

        // 3) Argumento inválido em método próprio.
        try {
            sacar(100, -5);
        } catch (IllegalArgumentException e) {
            System.debug('Argumento inválido: ' + e.getMessage());
        }

        // 4) DML fora de teste pode falhar; aqui o erro é capturado e tratado.
        //    Em uma org real, insert sem Name lança DmlException.
        try {
            Account semNome = new Account();
            insert semNome;
        } catch (DmlException e) {
            System.debug('Falha de DML: ' + e.getDmlMessage(0));
        }

        System.debug('Fim do exemplo: o programa continua após os erros.');
    }
}
