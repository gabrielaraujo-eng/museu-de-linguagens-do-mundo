/**
 * exercicio_2.cls - Conversão de Celsius para Fahrenheit
 *
 * Enunciado: converta temperaturas em graus Celsius para Fahrenheit usando a
 * fórmula F = C * 9 / 5 + 32, com uma casa decimal na saída.
 *
 * Tópico: Decimal, aritmética sem truncamento e setScale.
 * Saída esperada em Execute Anonymous (exercicio_2.executar()):
 *   0.0 °C = 32.0 °F
 *   25.0 °C = 77.0 °F
 *   37.0 °C = 98.6 °F
 *   100.0 °C = 212.0 °F
 */
public class exercicio_2 {

    public static Decimal celsiusParaFahrenheit(Decimal celsius) {
        // Todos os operandos são Decimal, então 9 / 5 vale 1.8 e não 1.
        Decimal fahrenheit = celsius * 9 / 5 + 32;
        return fahrenheit.setScale(1);
    }

    public static void executar() {
        List<Decimal> temperaturas = new List<Decimal>{0.0, 25.0, 37.0, 100.0};
        for (Decimal celsius : temperaturas) {
            Decimal fahrenheit = celsiusParaFahrenheit(celsius);
            System.debug(celsius.setScale(1) + ' °C = ' + fahrenheit + ' °F');
        }
    }
}
