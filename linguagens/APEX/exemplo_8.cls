/**
 * exemplo_8.cls - Manipulação de strings
 *
 * Tópico: os métodos mais usados de String em Apex. Strings são imutáveis:
 * todo método que "altera" devolve uma nova String.
 *
 * Execute Anonymous: exemplo_8.executar();
 */
public class exemplo_8 {

    public static void executar() {
        String frase = '  Apex é a linguagem do Salesforce  ';
        String limpa = frase.trim();

        System.debug('Original: [' + frase + ']');
        System.debug('Sem espaços nas pontas: [' + limpa + ']');
        System.debug('Tamanho: ' + limpa.length());
        System.debug('Maiúsculas: ' + limpa.toUpperCase());
        System.debug('Minúsculas: ' + limpa.toLowerCase());
        System.debug('Trecho 0-4: ' + limpa.substring(0, 4));
        System.debug('Contém "Salesforce"? ' + limpa.contains('Salesforce'));
        System.debug('Posição de "linguagem": ' + limpa.indexOf('linguagem'));
        System.debug('Começa com "Apex"? ' + limpa.startsWith('Apex'));
        System.debug('Substituindo: ' + limpa.replace('Salesforce', 'mundo'));

        // Divisão em palavras e remontagem com separador.
        List<String> palavras = limpa.split(' ');
        System.debug('Quantidade de palavras: ' + palavras.size());
        for (String palavra : palavras) {
            System.debug('- ' + palavra);
        }
        System.debug('Junção: ' + String.join(palavras, ' | '));

        // Comparações: == compara valor para String em Apex, mas o método
        // equalsIgnoreCase ignora a caixa.
        System.debug('"APEX" == "apex"? ' + ('APEX' == 'apex'));
        System.debug('equalsIgnoreCase: ' + 'APEX'.equalsIgnoreCase('apex'));

        // Verificação de vazio: String.isBlank também trata espaços.
        String soEspacos = '   ';
        System.debug('Está em branco? ' + String.isBlank(soEspacos));
        System.debug('Está vazia? ' + (soEspacos.length() == 0));

        // Percorrer caractere por caractere com substring.
        String sigla = '';
        for (Integer i = 0; i < palavras.size(); i++) {
            sigla += palavras[i].substring(0, 1).toUpperCase();
        }
        System.debug('Sigla: ' + sigla);
    }
}
