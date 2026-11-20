/*
 * exemplo_3.aj - "call" versus "execution".
 *
 * Os dois pointcuts descrevem o mesmo metodo, mas em join points diferentes:
 *   call(void Ex3Servico.processar(String))      -> no ponto de chamada
 *   execution(void Ex3Servico.processar(String)) -> dentro do metodo
 * Por isso o advice de "call" enxerga a classe chamadora, enquanto o de
 * "execution" roda ja dentro do objeto alvo. A ordem observada e:
 * call -> execution -> corpo do metodo.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_3.aj
 * Executar: java -cp out:aspectjrt.jar Ex3Cliente
 */

class Ex3Servico {

    public void processar(String pedido) {
        System.out.println("  [servico] processando: " + pedido);
    }
}

class Ex3Cliente {

    public static void main(String[] args) {
        Ex3Servico servico = new Ex3Servico();
        servico.processar("pedido-1");
        servico.processar("pedido-2");
    }
}

aspect Ex3ChamadaVersusExecucao {

    pointcut chamada(): call(void Ex3Servico.processar(String));

    pointcut execucao(): execution(void Ex3Servico.processar(String));

    /* No join point de chamada, getSourceLocation() aponta para a linha do
     * chamador (Ex3Cliente.main). */
    before(): chamada() {
        System.out.println("[call] chamada disparada em "
            + thisJoinPoint.getSourceLocation().getWithinType().getName());
    }

    before(): execucao() {
        System.out.println("[execution] o corpo do metodo vai rodar");
    }
}
