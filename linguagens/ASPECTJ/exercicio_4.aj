/*
 * exercicio_4.aj - Memoizacao (cache) com "around".
 *
 * Tarefa: evitar recalcular fib(n) ja conhecido, reduzindo o numero de
 * execucoes do corpo do metodo recursivo.
 *
 * Solucao: um mapa mantido no aspecto guarda os resultados; o advice devolve
 * o valor do cache sem chamar proceed() quando a chave existe.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_4.aj
 * Executar: java -cp out:aspectjrt.jar Exer4Fibonacci
 */

class Exer4Fibonacci {

    static int execucoes = 0;

    public int fib(int n) {
        execucoes = execucoes + 1;
        if (n < 2) {
            return n;
        }
        return fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] args) {
        Exer4Fibonacci fibonacci = new Exer4Fibonacci();
        System.out.println("fib(10) = " + fibonacci.fib(10));
        System.out.println("execucoes do corpo do metodo: " + execucoes);
    }
}

aspect Exer4Cache {

    private java.util.Map<Integer, Integer> memo =
        new java.util.HashMap<Integer, Integer>();

    int around(int n): execution(int Exer4Fibonacci.fib(int)) && args(n) {
        Integer guardado = memo.get(Integer.valueOf(n));
        if (guardado != null) {
            return guardado.intValue();
        }
        int valor = proceed(n);
        memo.put(Integer.valueOf(n), Integer.valueOf(valor));
        return valor;
    }
}
