/*
 * exemplo_7.aj - Loops, recursao e o rastreio com "within" e "cflow".
 *
 *   within(Tipo)   -> o codigo que executa esta definido em Tipo
 *   cflow(p)       -> o join point ocorre durante a execucao de algum join
 *                     point casado por p (incluindo o proprio p)
 * O aspecto usa um contador para medir a profundidade da recursao.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_7.aj
 * Executar: java -cp out:aspectjrt.jar Ex7Principal
 */

class Ex7Fatorial {

    /* Recursao: cada chamada interna e um novo join point. */
    public static int fatorial(int n) {
        Ex7Aux.registrar("fatorial(" + n + ")");
        if (n <= 1) {
            return 1;
        }
        return n * fatorial(n - 1);
    }

    /* Laco simples, para comparar com a recursao. */
    public static int somaIterativa(int limite) {
        int soma = 0;
        for (int i = 1; i <= limite; i++) {
            soma = soma + i;
        }
        return soma;
    }
}

class Ex7Aux {
    static void registrar(String mensagem) {
        System.out.println("    " + mensagem);
    }
}

class Ex7Principal {

    public static void main(String[] args) {
        Ex7Aux.registrar("inicio (fora do calculo)");
        System.out.println("5! = " + Ex7Fatorial.fatorial(5));
        System.out.println("soma 1..5 = " + Ex7Fatorial.somaIterativa(5));
    }
}

aspect Ex7Rastreio {

    private int profundidade = 0;

    pointcut execucaoFatorial(): execution(int Ex7Fatorial.fatorial(int));

    /* A chamada feita pelo main vem de Ex7Principal... */
    pointcut chamadaExterna():
        call(int Ex7Fatorial.fatorial(int)) && within(Ex7Principal);

    /* ...e as demais vem de dentro da propria classe recursiva. */
    pointcut chamadaRecursiva():
        call(int Ex7Fatorial.fatorial(int)) && within(Ex7Fatorial);

    pointcut dentroDoCalculo(): cflow(execucaoFatorial());

    before(): chamadaExterna() {
        System.out.println("[within] chamada vinda de Ex7Principal");
    }

    before(): chamadaRecursiva() {
        System.out.println("[within] chamada recursiva interna");
    }

    before(): execucaoFatorial() {
        profundidade = profundidade + 1;
    }

    after(): execucaoFatorial() {
        profundidade = profundidade - 1;
    }

    before(): call(void Ex7Aux.registrar(String)) && dentroDoCalculo() {
        System.out.println("[cflow] profundidade = " + profundidade);
    }

    /* Fora do fluxo de fatorial, o mesmo registro nao e anotado. */
    before(): call(void Ex7Aux.registrar(String)) && !dentroDoCalculo() {
        System.out.println("[fora do cflow] registro fora do calculo");
    }
}
