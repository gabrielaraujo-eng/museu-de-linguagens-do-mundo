/**
 * exercicio_1.cls - Saudação personalizada
 *
 * Enunciado: escreva um método que receba um nome e devolva uma saudação.
 * Se o nome vier nulo ou em branco, use "visitante".
 *
 * Tópico: classe, método estático, String, operador ternário e if.
 * Saída esperada em Execute Anonymous (exercicio_1.executar()):
 *   Olá, Ana! Bem-vindo ao Museu de Linguagens do Mundo.
 *   Olá, visitante! Bem-vindo ao Museu de Linguagens do Mundo.
 *   Olá, visitante! Bem-vindo ao Museu de Linguagens do Mundo.
 */
public class exercicio_1 {

    public static String saudacao(String nome) {
        // Normaliza nulo antes de chamar trim(), que falharia com nulo.
        String tratado = (nome == null) ? '' : nome.trim();
        if (String.isBlank(tratado)) {
            tratado = 'visitante';
        }
        return 'Olá, ' + tratado + '! Bem-vindo ao Museu de Linguagens do Mundo.';
    }

    public static void executar() {
        System.debug(saudacao('Ana'));
        System.debug(saudacao('   '));
        System.debug(saudacao(null));
    }
}
