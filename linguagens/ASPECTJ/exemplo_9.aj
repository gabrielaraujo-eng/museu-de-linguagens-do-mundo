/*
 * exemplo_9.aj - Aspectos estaticos: "declare parents", "declare warning",
 * "declare error" e "declare precedence".
 *
 * Essas declaracoes mudam a estrutura do programa (hierarquia de tipos) ou
 * produzem mensagens de compilacao, sem precisar de advice:
 *
 *   declare parents   : faz um tipo herdar de outro ou implementar interface
 *   declare warning   : aviso do compilador quando o pointcut casa
 *   declare error     : erro de compilacao quando o pointcut casa
 *   declare precedence: define a ordem entre aspectos no mesmo join point
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_9.aj
 * Executar: java -cp out:aspectjrt.jar Ex9Pedido
 */

class Ex9Pedido {

    private final int numero;

    public Ex9Pedido(int numero) {
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    public void imprimir() {
        System.out.println("  [pedido] numero " + numero);
    }

    public static void main(String[] args) {
        Ex9Pedido pedido = new Ex9Pedido(42);
        pedido.imprimir();

        /* declare parents: o pedido passa a ser serializavel. */
        System.out.println("Serializable? " + (pedido instanceof java.io.Serializable));

        java.util.List<String> itens = new java.util.ArrayList<String>();
        itens.add("caneta");   /* provoca o "declare warning" na compilacao */
        System.out.println("itens: " + itens);
    }
}

aspect Ex9Log {

    before(): execution(void Ex9Pedido.imprimir()) {
        System.out.println("[log] antes de imprimir");
    }
}

aspect Ex9Auditoria {

    before(): execution(void Ex9Pedido.imprimir()) {
        System.out.println("[auditoria] antes de imprimir");
    }
}

aspect Ex9Contrato {

    /* O pedido passa a implementar Serializable. */
    declare parents: Ex9Pedido implements java.io.Serializable;

    /* Auditoria roda antes do log no mesmo join point. */
    declare precedence: Ex9Auditoria, Ex9Log;

    /* Aviso de compilacao para chamadas a List.add. */
    declare warning: call(* java.util.List.add(..)):
        "prefira criar a lista ja preenchida com Arrays.asList";

    /* Erro de compilacao para API obsoleta; aqui o pointcut nao casa com
     * nada, entao a compilacao continua valida. */
    declare error: call(void java.lang.Thread.stop()):
        "Thread.stop() nao deve ser usado";
}
