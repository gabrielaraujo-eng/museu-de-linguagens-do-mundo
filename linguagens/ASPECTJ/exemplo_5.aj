/*
 * exemplo_5.aj - Tratamento de erros com "after returning" e "after throwing".
 *
 * "after() throwing (T e)" roda quando o join point termina com excecao
 * compativel com T; ele observa a excecao, mas NAO a engole (para alterar o
 * fluxo seria preciso "around"). "after() returning (T v)" roda no termino
 * normal e recebe o valor devolvido.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_5.aj
 * Executar: java -cp out:aspectjrt.jar Ex5Servico
 */

class Ex5Servico {

    public int calcular(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException("divisor igual a zero");
        }
        return a / b;
    }

    public void registrar(String mensagem) {
        System.out.println("  [servico] " + mensagem);
    }

    public static void main(String[] args) {
        Ex5Servico servico = new Ex5Servico();
        try {
            System.out.println("resultado: " + servico.calcular(12, 4));
            System.out.println("resultado: " + servico.calcular(7, 0));
        } catch (ArithmeticException e) {
            System.out.println("main capturou: " + e.getMessage());
        }
        servico.registrar("fim");
    }
}

aspect Ex5Tratamento {

    /* Vincula o valor de retorno do metodo (int). */
    after() returning (int valor): execution(int Ex5Servico.calcular(int, int)) {
        System.out.println("[retorno normal] valor = " + valor);
    }

    /* Vincula a excecao lancada; o metodo main ainda a recebe. */
    after() throwing (ArithmeticException e):
            execution(int Ex5Servico.calcular(int, int)) {
        System.out.println("[excecao] " + e.getMessage());
    }

    /* Metodo void: "returning" sem vinculo de valor. */
    after() returning: execution(void Ex5Servico.registrar(String)) {
        System.out.println("[retorno normal] registrar concluido");
    }
}
