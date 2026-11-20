/*
 * exercicio_1.aj - Contador de chamadas.
 *
 * Tarefa: contar quantas vezes o metodo tic() e executado e mostrar o total
 * no final do programa, sem alterar o codigo da classe Exer1Relogio.
 *
 * Solucao: um advice "before" sobre o pointcut de execucao incrementa um
 * campo do proprio aspecto; um advice "after" sobre o main imprime o total.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_1.aj
 * Executar: java -cp out:aspectjrt.jar Exer1Relogio
 */

class Exer1Relogio {

    public void tic() {
        System.out.println("  tic");
    }

    public static void main(String[] args) {
        Exer1Relogio relogio = new Exer1Relogio();
        for (int i = 0; i < 4; i++) {
            relogio.tic();
        }
        System.out.println("Laco encerrado.");
    }
}

aspect Exer1Contador {

    /* Estado do aspecto: existe uma instancia (aspectos sao singletons por
     * padrao), entao o contador sobrevive entre os join points. */
    private int chamadas = 0;

    before(): execution(void Exer1Relogio.tic()) {
        chamadas = chamadas + 1;
    }

    after(): execution(public static void Exer1Relogio.main(String[])) {
        System.out.println("tic() foi chamado " + chamadas + " vez(es).");
    }
}
