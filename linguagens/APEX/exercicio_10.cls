/**
 * exercicio_10.cls - Ordenação e busca binária
 *
 * Enunciado: ordene uma lista de inteiros por seleção (sem usar sort pronto)
 * e localize um valor com busca binária, devolvendo o índice ou -1.
 *
 * Tópico: algoritmos clássicos com List<Integer>, troca de elementos por
 * índice e laço while com dois ponteiros.
 * Saída esperada em Execute Anonymous (exercicio_10.executar()):
 *   Original: (42, 7, 19, 3, 88, 15)
 *   Ordenada: (3, 7, 15, 19, 42, 88)
 *   Índice de 19: 3
 *   Índice de 50: -1
 *   Original preservada: (42, 7, 19, 3, 88, 15)
 */
public class exercicio_10 {

    /** Devolve uma cópia ordenada; a lista recebida não é alterada. */
    public static List<Integer> ordenarPorSelecao(List<Integer> entrada) {
        List<Integer> valores = entrada.clone();
        for (Integer i = 0; i < valores.size() - 1; i++) {
            Integer menor = i;
            for (Integer j = i + 1; j < valores.size(); j++) {
                if (valores[j] < valores[menor]) {
                    menor = j;
                }
            }
            if (menor != i) {
                Integer troca = valores[i];
                valores[i] = valores[menor];
                valores[menor] = troca;
            }
        }
        return valores;
    }

    /** Busca binária em lista já ordenada; devolve o índice ou -1. */
    public static Integer buscaBinaria(List<Integer> ordenada, Integer alvo) {
        Integer inicio = 0;
        Integer fim = ordenada.size() - 1;
        while (inicio <= fim) {
            Integer meio = (inicio + fim) / 2;
            if (ordenada[meio] == alvo) {
                return meio;
            }
            if (ordenada[meio] < alvo) {
                inicio = meio + 1;
            } else {
                fim = meio - 1;
            }
        }
        return -1;
    }

    public static void executar() {
        List<Integer> original = new List<Integer>{42, 7, 19, 3, 88, 15};
        List<Integer> ordenada = ordenarPorSelecao(original);

        System.debug('Original: ' + original);
        System.debug('Ordenada: ' + ordenada);
        System.debug('Índice de 19: ' + buscaBinaria(ordenada, 19));
        System.debug('Índice de 50: ' + buscaBinaria(ordenada, 50));
        System.debug('Original preservada: ' + original);
    }
}
