/**
 * exemplo_1.cls - "Olá, Mundo" em Apex
 *
 * Tópico: estrutura mínima de uma classe Apex.
 *
 * Em Apex, todo código pertence a uma classe (ou a um trigger). Não existe
 * programa solto: uma instrução como System.debug('...') fora de uma classe
 * só é aceita na janela "Execute Anonymous" do Developer Console, nunca em um
 * arquivo .cls.
 *
 * Como executar (Execute Anonymous):
 *   exemplo_1.executar();
 */
public class exemplo_1 {

    /**
     * Método de entrada usado pelos exemplos desta pasta.
     * É estático para poder ser chamado sem instanciar a classe.
     */
    public static void executar() {
        // System.debug grava a mensagem no log de depuração.
        System.debug('Olá, Mundo!');

        // Uma String também pode ser montada em uma variável antes da saída.
        String mensagem = 'Olá, Mundo!';
        System.debug('Mensagem: ' + mensagem);

        // Concatenação com variáveis e números.
        Integer ano = 2006;
        System.debug('Apex existe desde ' + ano + '.');
    }
}
