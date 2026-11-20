/*
 * exemplo_1.aj - "Ola Mundo" em AspectJ.
 *
 * AspectJ e uma extensao orientada a aspectos de Java, criada no Xerox PARC
 * em 2001 e hoje mantida pela Eclipse Foundation. Um arquivo .aj pode conter
 * classes Java comuns e aspectos. Um aspecto modula um interesse transversal
 * (crosscutting concern): aqui, o "antes e depois" da execucao do programa.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_1.aj
 * Executar: java -cp out:aspectjrt.jar Ex1OlaMundo
 */

class Ex1OlaMundo {

    public static void main(String[] args) {
        System.out.println("Executando o corpo do main...");
    }
}

aspect Ex1Saudacao {

    /* Pointcut nomeado: o join point de execucao do main desta classe.
     * "execution(assinatura)" casa com a execucao do metodo, nao com as
     * chamadas a ele. */
    pointcut inicioDoPrograma():
        execution(public static void Ex1OlaMundo.main(String[]));

    /* Advice "before": executa imediatamente antes do join point. */
    before(): inicioDoPrograma() {
        System.out.println("Ola Mundo");
    }

    /* Advice "after": executa quando o join point termina normalmente. */
    after(): inicioDoPrograma() {
        System.out.println("Fim da execucao.");
    }
}
