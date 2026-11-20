/*
 * exercicio_5.aj - Registro de falhas com "after throwing".
 *
 * Tarefa: registrar toda tentativa de saque que falha por saldo insuficiente
 * e tambem os saques bem-sucedidos, sem mexer na classe de dominio.
 *
 * Solucao: dois advices "after" no mesmo pointcut, um com "throwing" para o
 * caminho de excecao e outro com "returning" para o caminho normal. A excecao
 * continua chegando ao main, porque "after" nao a suprime.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_5.aj
 * Executar: java -cp out:aspectjrt.jar Exer5ContaBancaria
 */

class Exer5ContaBancaria {

    private double saldo = 100.0;

    public void sacar(double valor) {
        if (valor > saldo) {
            throw new IllegalStateException("saldo insuficiente para " + valor);
        }
        saldo = saldo - valor;
    }

    public double getSaldo() {
        return saldo;
    }

    public static void main(String[] args) {
        Exer5ContaBancaria conta = new Exer5ContaBancaria();
        conta.sacar(30.0);
        try {
            conta.sacar(500.0);
        } catch (IllegalStateException e) {
            System.out.println("main tratou: " + e.getMessage());
        }
        System.out.println("saldo final: " + conta.getSaldo());
    }
}

aspect Exer5Registro {

    private int falhas = 0;

    after() throwing (IllegalStateException e):
            execution(void Exer5ContaBancaria.sacar(double)) {
        falhas = falhas + 1;
        System.out.println("[registro] falha #" + falhas + ": " + e.getMessage());
    }

    after() returning: execution(void Exer5ContaBancaria.sacar(double)) {
        System.out.println("[registro] saque concluido com sucesso");
    }

    after(): execution(public static void Exer5ContaBancaria.main(String[])) {
        System.out.println("[registro] total de falhas: " + falhas);
    }
}
