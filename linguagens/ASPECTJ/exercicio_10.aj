/*
 * exercicio_10.aj - Monitor de desempenho no estilo @AspectJ.
 *
 * Tarefa: contar as execucoes dos metodos de Exer10Relatorio, avisar quando
 * uma delas passar de 20 ms e imprimir um resumo no fim do main.
 *
 * Solucao: classe anotada com @Aspect, com @Pointcut, @Before, @Around (que
 * cronometra e chama pjp.proceed()) e @AfterReturning sobre o main.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_10.aj
 * Executar: java -cp out:aspectjrt.jar Exer10Relatorio
 */

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;

class Exer10Relatorio {

    public void gerar(String titulo) {
        /* Simula trabalho pesado: cerca de 30 ms de espera ativa. */
        long inicio = System.nanoTime();
        while (System.nanoTime() - inicio < 30000000L) {
            /* espera */
        }
        System.out.println("  [relatorio] " + titulo + " gerado");
    }

    public int total(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Exer10Relatorio relatorio = new Exer10Relatorio();
        relatorio.gerar("vendas");
        System.out.println("total = " + relatorio.total(2, 2));
    }
}

@Aspect
class Exer10Monitor {

    private int execucoes = 0;
    private int lentas = 0;

    @Pointcut("execution(void Exer10Relatorio.gerar(String))"
            + " || execution(int Exer10Relatorio.total(int, int))")
    public void metodos() { }

    @Before("metodos()")
    public void contar() {
        execucoes = execucoes + 1;
    }

    @Around("metodos()")
    public Object medir(ProceedingJoinPoint pjp) throws Throwable {
        long inicio = System.nanoTime();
        Object resultado = pjp.proceed();
        long ms = (System.nanoTime() - inicio) / 1000000L;
        if (ms >= 20L) {
            lentas = lentas + 1;
            System.out.println("[@Around] " + pjp.getSignature().getName()
                + " lenta: " + ms + " ms");
        }
        return resultado;
    }

    @AfterReturning("execution(public static void Exer10Relatorio.main(String[]))")
    public void resumo() {
        System.out.println("[resumo] execucoes = " + execucoes + ", lentas = " + lentas);
    }
}
