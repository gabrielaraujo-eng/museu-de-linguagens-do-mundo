/*
 * exercicio_2.aj - Cronometro com advice "around".
 *
 * Tarefa: medir o tempo gasto por somaAte(int) e informar o resultado, sem
 * inserir codigo de medicao dentro do metodo.
 *
 * Solucao: "around" captura o instante antes de proceed(), executa o metodo
 * original e calcula a diferenca depois, devolvendo o valor original.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_2.aj
 * Executar: java -cp out:aspectjrt.jar Exer2Busca
 */

class Exer2Busca {

    public int somaAte(int limite) {
        int soma = 0;
        for (int i = 1; i <= limite; i++) {
            soma = soma + i;
        }
        return soma;
    }

    public static void main(String[] args) {
        Exer2Busca busca = new Exer2Busca();
        int resultado = busca.somaAte(100000);
        System.out.println("soma de 1 a 100000 = " + resultado);
    }
}

aspect Exer2Cronometro {

    int around(int limite): execution(int Exer2Busca.somaAte(int)) && args(limite) {
        long inicio = System.nanoTime();
        int resultado = proceed(limite);
        long duracao = (System.nanoTime() - inicio) / 1000000L;
        System.out.println("[cronometro] " + thisJoinPoint.getSignature().getName()
            + "(" + limite + ") levou " + duracao + " ms");
        return resultado;
    }
}
