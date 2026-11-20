/**
 * exemplo_6.cls - Estruturas de dados: List, Set e Map
 *
 * Tópico: as três coleções nativas de Apex. Todas são tipadas por generics
 * (List<String>, Map<String, Integer>), aceitam inicialização com chaves e
 * expõem métodos próprios (add, get, put, contains, keySet, values...).
 *
 * Execute Anonymous: exemplo_6.executar();
 */
public class exemplo_6 {

    public static void executar() {
        // List: sequência ordenada, com índices e elementos repetidos.
        List<String> linguagens = new List<String>{'Apex', 'Java', 'Python'};
        linguagens.add('Kotlin');
        System.debug('Tamanho da lista: ' + linguagens.size());
        System.debug('Primeiro elemento: ' + linguagens.get(0));
        System.debug('Lista completa: ' + linguagens);
        for (Integer i = 0; i < linguagens.size(); i++) {
            System.debug('índice ' + i + ': ' + linguagens[i]);
        }

        // Set: conjunto sem repetições e sem ordem garantida.
        Set<String> unicas = new Set<String>{'Apex', 'Java', 'Apex'};
        System.debug('Tamanho do conjunto: ' + unicas.size()); // 2
        System.debug('Contém Java? ' + unicas.contains('Java'));
        System.debug('Contém C#? ' + unicas.contains('C#'));
        unicas.add('Python');
        System.debug('Conjunto após add: ' + unicas);

        // Map: pares chave/valor; a chave é única.
        Map<String, Integer> idades = new Map<String, Integer>();
        idades.put('Ana', 30);
        idades.put('Bruno', 25);
        idades.put('Ana', 31); // sobrescreve a chave existente
        System.debug('Idade da Ana: ' + idades.get('Ana'));
        System.debug('Chaves: ' + idades.keySet());
        System.debug('Valores: ' + idades.values());
        System.debug('Tem Bruno? ' + idades.containsKey('Bruno'));
        for (String nome : idades.keySet()) {
            System.debug(nome + ' tem ' + idades.get(nome) + ' anos');
        }

        // Coleções aninhadas: mapa de listas.
        Map<String, List<String>> porArea = new Map<String, List<String>>();
        porArea.put('consulta', new List<String>{'SOQL', 'SOSL'});
        porArea.put('modelo', new List<String>{'sObject', 'Campo'});
        System.debug('Área consulta: ' + porArea.get('consulta'));
        System.debug('Áreas disponíveis: ' + porArea.size());

        // Remoção e verificação de vazio.
        idades.remove('Bruno');
        System.debug('Após remover Bruno: ' + idades.size());
        System.debug('Mapa vazio? ' + idades.isEmpty());
    }
}
