/*
 * exemplo_10.aj - Estilo @AspectJ: o mesmo poder, com anotacoes Java.
 *
 * Em vez da sintaxe "aspect", usa-se uma classe anotada com @Aspect e
 * metodos anotados com @Pointcut, @Before, @AfterReturning e @Around. Esse
 * formato e o que permite escrever aspectos em arquivos .java comuns e
 * integra-los a frameworks como Spring AOP.
 *
 * Observacao de semantica: quando dois advice do mesmo aspecto incidem sobre
 * o mesmo join point, o compilador exige uma ordem definida - se um deles for
 * "around", ele responde com "circular advice precedence". Por isso cada
 * advice deste exemplo cuida de um pointcut distinto.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -source 17 -target 17 -cp aspectjrt.jar -d out exemplo_10.aj
 * Executar: java -cp out:aspectjrt.jar Ex10Tarefa
 */

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

class Ex10Tarefa {

    public void executar(String nome) {
        System.out.println("  [tarefa] executando " + nome);
    }

    public int somar(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Ex10Tarefa tarefa = new Ex10Tarefa();
        tarefa.executar("backup");
        System.out.println("soma = " + tarefa.somar(2, 3));
    }
}

@Aspect
class Ex10Perfil {

    /* Pointcut nomeado por anotacao: casa com a execucao de executar(String). */
    @Pointcut("execution(void Ex10Tarefa.executar(String))")
    public void tarefa() { }

    @Before("tarefa()")
    public void antes() {
        System.out.println("[@Before] entrando em Ex10Tarefa.executar");
    }

    /* @Around recebe um ProceedingJoinPoint e decide quando (e se) chamar
     * pjp.proceed(). */
    @Around("execution(int Ex10Tarefa.somar(int, int))")
    public Object medir(ProceedingJoinPoint pjp) throws Throwable {
        long inicio = System.nanoTime();
        Object resultado = pjp.proceed();
        long nanos = System.nanoTime() - inicio;
        System.out.println("[@Around] " + pjp.getSignature().getName()
            + " levou " + nanos + " ns");
        return resultado;
    }

    @AfterReturning("execution(public static void Ex10Tarefa.main(String[]))")
    public void depoisDoMain() {
        System.out.println("[@AfterReturning] fim do programa");
    }
}
