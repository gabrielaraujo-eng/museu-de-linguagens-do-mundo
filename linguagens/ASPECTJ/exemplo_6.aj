/*
 * exemplo_6.aj - Expondo o contexto do join point: this, target, args e
 * thisJoinPoint.
 *
 *   this(x)   -> objeto que esta executando o codigo
 *   target(x) -> objeto que recebe a operacao (o alvo da chamada)
 *   args(x)   -> argumentos do join point
 * Em um join point de execucao de metodo, this e target sao o mesmo objeto;
 * em um join point de chamada eles podem ser diferentes.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_6.aj
 * Executar: java -cp out:aspectjrt.jar Ex6Pedido
 */

class Ex6Pedido {

    private final String cliente;
    private double total;

    public Ex6Pedido(String cliente) {
        this.cliente = cliente;
        this.total = 0.0;
    }

    public void adicionar(double valor) {
        total = total + valor;
    }

    public String getCliente() {
        return cliente;
    }

    public double getTotal() {
        return total;
    }

    public static void main(String[] args) {
        Ex6Pedido pedido = new Ex6Pedido("Bruno");
        pedido.adicionar(30.0);
        pedido.adicionar(12.5);
        System.out.println(pedido.getCliente() + ": total " + pedido.getTotal());
    }
}

aspect Ex6Contexto {

    pointcut adicao(Ex6Pedido alvo, double valor):
        execution(void Ex6Pedido.adicionar(double)) && target(alvo) && args(valor);

    /* thisJoinPoint da acesso a assinatura, argumentos e origem do join
     * point corrente. */
    before(Ex6Pedido alvo, double valor): adicao(alvo, valor) {
        System.out.println("[contexto] " + alvo.getCliente() + " adiciona " + valor
            + " em " + thisJoinPoint.getSignature().toShortString()
            + " (alvo=" + alvo.getClass().getSimpleName()
            + ", this=" + thisJoinPoint.getThis().getClass().getSimpleName() + ")");
    }

    /* Restricao por tipo do objeto corrente: so pedidos de cliente "VIP". */
    pointcut adicaoVip(double valor):
        execution(void Ex6Pedido.adicionar(double)) && args(valor) && if(valor >= 20.0);

    before(double valor): adicaoVip(valor) {
        System.out.println("[if] valor alto detectado: " + valor);
    }
}
