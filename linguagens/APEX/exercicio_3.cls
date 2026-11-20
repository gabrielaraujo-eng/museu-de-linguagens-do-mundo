/**
 * exercicio_3.cls - Classificação de notas
 *
 * Enunciado: classifique uma nota de 0 a 10 em "Aprovado" (>= 7),
 * "Recuperação" (>= 5) ou "Reprovado" (< 5). Notas fora do intervalo são
 * inválidas.
 *
 * Tópico: if / else if / else com validação de faixa.
 * Saída esperada em Execute Anonymous (exercicio_3.executar()):
 *   Nota 9.5: Aprovado
 *   Nota 7.0: Aprovado
 *   Nota 6.4: Recuperação
 *   Nota 4.9: Reprovado
 *   Nota 11.0: Nota inválida
 */
public class exercicio_3 {

    public static String classificar(Decimal nota) {
        if (nota < 0 || nota > 10) {
            return 'Nota inválida';
        } else if (nota >= 7) {
            return 'Aprovado';
        } else if (nota >= 5) {
            return 'Recuperação';
        } else {
            return 'Reprovado';
        }
    }

    public static void executar() {
        List<Decimal> notas = new List<Decimal>{9.5, 7.0, 6.4, 4.9, 11.0};
        for (Decimal nota : notas) {
            System.debug('Nota ' + nota.setScale(1) + ': ' + classificar(nota));
        }
    }
}
