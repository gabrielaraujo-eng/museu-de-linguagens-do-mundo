/**
 * exercicio_6.cls - Estatísticas de uma lista de notas
 *
 * Enunciado: dada uma lista de notas, calcule a média, a maior e a menor nota
 * e informe quantos valores distintos existem.
 *
 * Tópico: List<Decimal> com for-each, acumulador, comparação de máximos e
 * uso de Set para contar valores únicos.
 * Saída esperada em Execute Anonymous (exercicio_6.executar()):
 *   Média: 7.1
 *   Maior: 9.0
 *   Menor: 4.5
 *   Notas distintas: 5
 */
public class exercicio_6 {

    public static Decimal media(List<Decimal> notas) {
        if (notas == null || notas.isEmpty()) {
            return 0;
        }
        Decimal soma = 0;
        for (Decimal nota : notas) {
            soma += nota;
        }
        return (soma / notas.size()).setScale(1);
    }

    public static Decimal maior(List<Decimal> notas) {
        Decimal referencia = notas[0];
        for (Decimal nota : notas) {
            if (nota > referencia) {
                referencia = nota;
            }
        }
        return referencia;
    }

    public static Decimal menor(List<Decimal> notas) {
        Decimal referencia = notas[0];
        for (Decimal nota : notas) {
            if (nota < referencia) {
                referencia = nota;
            }
        }
        return referencia;
    }

    public static Integer distintas(List<Decimal> notas) {
        Set<Decimal> unicas = new Set<Decimal>();
        for (Decimal nota : notas) {
            unicas.add(nota);
        }
        return unicas.size();
    }

    public static void executar() {
        List<Decimal> notas = new List<Decimal>{7.5, 9.0, 4.5, 8.0, 6.5};
        System.debug('Média: ' + media(notas));
        System.debug('Maior: ' + maior(notas).setScale(1));
        System.debug('Menor: ' + menor(notas).setScale(1));
        System.debug('Notas distintas: ' + distintas(notas));
    }
}
