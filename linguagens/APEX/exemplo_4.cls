/**
 * exemplo_4.cls - Laços de repetição
 *
 * Tópico: for tradicional com contador, for-each sobre coleções, while,
 * do-while e os comandos break e continue.
 *
 * Execute Anonymous: exemplo_4.executar();
 */
public class exemplo_4 {

    public static void executar() {
        // 1) for com contador (a forma C-like é aceita em Apex).
        for (Integer i = 1; i <= 5; i++) {
            System.debug('for: iteração ' + i);
        }

        // 2) for-each: percorre os elementos de uma lista.
        List<String> linguagens = new List<String>{'Apex', 'Java', 'Python'};
        for (String linguagem : linguagens) {
            System.debug('for-each: ' + linguagem);
        }

        // 3) while: testa a condição antes de cada volta.
        Integer contador = 0;
        while (contador < 3) {
            contador++;
            System.debug('while: ' + contador);
        }

        // 4) do-while: executa o corpo ao menos uma vez.
        Integer tentativas = 0;
        do {
            tentativas++;
            System.debug('do-while: tentativa ' + tentativas);
        } while (tentativas < 2);

        // 5) break e continue dentro do for.
        for (Integer i = 1; i <= 10; i++) {
            if (Math.mod(i, 2) == 0) {
                continue; // pula os pares
            }
            if (i > 7) {
                break;    // encerra o laço ao passar de 7
            }
            System.debug('ímpar até 7: ' + i);
        }

        // 6) Laço sobre um mapa, usando o conjunto de chaves.
        Map<String, Integer> estoque = new Map<String, Integer>();
        estoque.put('teclado', 12);
        estoque.put('mouse', 30);
        for (String item : estoque.keySet()) {
            System.debug('estoque de ' + item + ': ' + estoque.get(item));
        }
    }
}
