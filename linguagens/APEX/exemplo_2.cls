/**
 * exemplo_2.cls - Variáveis e tipos primitivos
 *
 * Tópico: declaração, atribuição e conversão entre os tipos básicos de Apex:
 * Integer, Long, Decimal, Double, String, Boolean, Date e DateTime.
 *
 * Observação importante: Apex não tem tipos primitivos "puros"; todos os
 * valores são objetos, mas aceitam literais e operadores aritméticos usuais.
 *
 * Execute Anonymous: exemplo_2.executar();
 */
public class exemplo_2 {

    public static void executar() {
        // Inteiros de 32 bits e de 64 bits (sufixo L no literal Long).
        Integer quantidade = 42;
        Long populacao = 8000000000L;

        // Decimal é o tipo numérico com precisão arbitrária, usado em dinheiro.
        Decimal preco = 19.90;
        Double medida = 2.5;

        String produto = 'Apex';
        Boolean ativo = true;
        Date hoje = Date.today();
        DateTime agora = DateTime.now();

        System.debug('Integer: ' + quantidade);
        System.debug('Long: ' + populacao);
        System.debug('Decimal: ' + preco);
        System.debug('Double: ' + medida);
        System.debug('String: ' + produto);
        System.debug('Boolean: ' + ativo);
        System.debug('Date: ' + hoje);
        System.debug('DateTime: ' + agora);

        // Conversões explícitas entre tipos.
        Integer deTexto = Integer.valueOf('123');
        Decimal deTextoDecimal = Decimal.valueOf('12.50');
        String numeroComoTexto = String.valueOf(quantidade);
        Double decimalComoDouble = preco.doubleValue();
        Integer textoComoInteiro = Integer.valueOf(numeroComoTexto);

        System.debug('Integer.valueOf("123") = ' + deTexto);
        System.debug('Decimal.valueOf("12.50") = ' + deTextoDecimal);
        System.debug('String.valueOf(42) = ' + numeroComoTexto);
        System.debug('preco.doubleValue() = ' + decimalComoDouble);
        System.debug('Volta para Integer = ' + textoComoInteiro);

        // Aritmética: atenção à divisão inteira.
        System.debug('7 / 2 (Integer) = ' + (7 / 2));          // 3, trunca
        Decimal sete = 7;
        System.debug('7 / 2 (Decimal) = ' + (sete / 2));        // 3.5
    }
}
