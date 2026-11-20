/*
 * exemplo_2.aj - Tipos, variaveis e um pointcut que expoe o contexto.
 *
 * Mostra: campos de tipos primitivos e de referencia (int, double, String),
 * um pointcut com "target(...)" e "args(...)", e os dois sabores de advice
 * "after": sem valor de retorno e com "returning".
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_2.aj
 * Executar: java -cp out:aspectjrt.jar Ex2Conta
 */

class Ex2Conta {

    private String titular;   /* tipo de referencia */
    private double saldo;     /* ponto flutuante */
    private int operacoes;    /* inteiro */

    public Ex2Conta(String titular) {
        this.titular = titular;
        this.saldo = 0.0;
        this.operacoes = 0;
    }

    public void depositar(double valor) {
        saldo = saldo + valor;
        operacoes = operacoes + 1;
    }

    public String getTitular() {
        return titular;
    }

    public double getSaldo() {
        return saldo;
    }

    public int getOperacoes() {
        return operacoes;
    }

    public static void main(String[] args) {
        Ex2Conta conta = new Ex2Conta("Ana");
        conta.depositar(100.50);
        conta.depositar(49.50);
        System.out.println("Titular: " + conta.getTitular());
        System.out.println("Saldo final: " + conta.getSaldo());
        System.out.println("Operacoes: " + conta.getOperacoes());
    }
}

aspect Ex2Auditoria {

    /* O pointcut expoe dois valores: o objeto alvo (target) e o argumento
     * double do metodo (args). Os nomes "conta" e "valor" sao ligados aos
     * parametros formais do advice pela ordem e pelo tipo. */
    pointcut deposito(Ex2Conta conta, double valor):
        execution(void Ex2Conta.depositar(double)) && target(conta) && args(valor);

    before(Ex2Conta conta, double valor): deposito(conta, valor) {
        System.out.println("[antes] " + conta.getTitular()
            + " vai depositar " + valor);
    }

    /* "after ... returning" roda apenas quando o metodo termina sem excecao. */
    after(Ex2Conta conta, double valor) returning: deposito(conta, valor) {
        System.out.println("[depois] saldo agora: " + conta.getSaldo());
    }
}
