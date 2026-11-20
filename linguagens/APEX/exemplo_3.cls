/**
 * exemplo_3.cls - Controle de fluxo
 *
 * Tópico: if / else if / else, operador ternário e a instrução switch on,
 * que em Apex aceita Integer, Long, String, Enum e sObject como expressão.
 * Cada bloco when aceita vários literais separados por vírgula e não há
 * "fall-through": o switch sai depois do primeiro bloco que casa.
 *
 * Execute Anonymous: exemplo_3.executar();
 */
public class exemplo_3 {

    /** if / else if / else encadeados. */
    public static String categoriaPorIdade(Integer idade) {
        if (idade < 0) {
            return 'idade inválida';
        } else if (idade < 12) {
            return 'criança';
        } else if (idade < 18) {
            return 'adolescente';
        } else {
            return 'adulto';
        }
    }

    /**
     * switch on com literais inteiros e bloco when else obrigatoriamente por
     * último. O resultado é atribuído a uma variável e devolvido no fim,
     * para não depender de análise de fluxo dentro do switch.
     */
    public static String trimestreDoMes(Integer mes) {
        String faixa;
        switch on mes {
            when 1, 2, 3 {
                faixa = 'primeiro trimestre';
            }
            when 4, 5, 6 {
                faixa = 'segundo trimestre';
            }
            when 7, 8, 9 {
                faixa = 'terceiro trimestre';
            }
            when 10, 11, 12 {
                faixa = 'quarto trimestre';
            }
            when else {
                faixa = 'mês fora do intervalo 1-12';
            }
        }
        return faixa;
    }

    /** switch on com String (comparação sensível a maiúsculas/minúsculas). */
    public static String nivelDoPlano(String plano) {
        switch on plano {
            when 'bronze' {
                return 'básico';
            }
            when 'prata', 'ouro' {
                return 'intermediário';
            }
            when else {
                return 'desconhecido';
            }
        }
    }

    public static void executar() {
        System.debug('8 anos: ' + categoriaPorIdade(8));
        System.debug('15 anos: ' + categoriaPorIdade(15));
        System.debug('40 anos: ' + categoriaPorIdade(40));

        System.debug('Mês 5: ' + trimestreDoMes(5));
        System.debug('Mês 13: ' + trimestreDoMes(13));

        System.debug('Plano "ouro": ' + nivelDoPlano('ouro'));
        System.debug('Plano "Ouro": ' + nivelDoPlano('Ouro')); // case-sensitive

        // Operador ternário: condição ? valorSeVerdadeiro : valorSeFalso.
        Boolean aprovado = true;
        String situacao = aprovado ? 'aprovado' : 'reprovado';
        System.debug('Situação: ' + situacao);
    }
}
