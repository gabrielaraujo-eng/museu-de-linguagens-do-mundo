/**
 * exemplo_5.cls - Métodos, sobrecarga e recursão
 *
 * Tópico: métodos estáticos com tipo de retorno, parâmetros, sobrecarga
 * (mesmo nome com assinaturas diferentes) e recursão. Apex não tem
 * parâmetros com valor padrão; o equivalente é sobrecarregar o método.
 *
 * Execute Anonymous: exemplo_5.executar();
 */
public class exemplo_5 {

    /** Soma de dois inteiros. */
    public static Integer somar(Integer a, Integer b) {
        return a + b;
    }

    /** Sobrecarga: mesma operação com Decimal (usada para dinheiro). */
    public static Decimal somar(Decimal a, Decimal b) {
        return a + b;
    }

    /** Sobrecarga: concatenação de textos. */
    public static String somar(String a, String b) {
        return a + b;
    }

    /** Método sem retorno (void): apenas registra no log. */
    public static void registrar(String evento) {
        System.debug('[registro] ' + evento);
    }

    /** Recursão: fatorial com Long para adiar o estouro de 32 bits. */
    public static Long fatorial(Integer n) {
        if (n < 0) {
            throw new IllegalArgumentException('n deve ser maior ou igual a zero.');
        }
        if (n <= 1) {
            return 1;
        }
        return n * fatorial(n - 1);
    }

    /** Recursão com dois argumentos: máximo divisor comum (Euclides). */
    public static Integer mdc(Integer a, Integer b) {
        if (b == 0) {
            return a;
        }
        return mdc(b, Math.mod(a, b));
    }

    public static void executar() {
        System.debug('somar(2, 3) = ' + somar(2, 3));
        System.debug('somar(2.50, 3.25) = ' + somar(2.50, 3.25));
        System.debug('somar("Apex", "!") = ' + somar('Apex', '!'));

        registrar('início dos cálculos');

        System.debug('fatorial(5) = ' + fatorial(5));
        System.debug('fatorial(10) = ' + fatorial(10));
        System.debug('mdc(48, 18) = ' + mdc(48, 18));

        registrar('fim dos cálculos');
    }
}
