/*
 * exercicio_6.aj - Log formatado de entrada e saida de metodos.
 *
 * Tarefa: registrar, para cada metodo de Exer6Conversor, a assinatura, o
 * argumento recebido e o valor devolvido.
 *
 * Solucao: "before" com args() para a entrada; "after returning (T)" com o
 * tipo exato de cada retorno (double e String) para a saida.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_6.aj
 * Executar: java -cp out:aspectjrt.jar Exer6Conversor
 */

class Exer6Conversor {

    public double celsiusParaFahrenheit(double celsius) {
        return celsius * 9.0 / 5.0 + 32.0;
    }

    public String rotulo(String escala) {
        return "temperatura em " + escala;
    }

    public static void main(String[] args) {
        Exer6Conversor conversor = new Exer6Conversor();
        System.out.println("resultado = " + conversor.celsiusParaFahrenheit(100.0));
        System.out.println(conversor.rotulo("Fahrenheit"));
    }
}

aspect Exer6Log {

    before(double celsius):
            execution(double Exer6Conversor.celsiusParaFahrenheit(double)) && args(celsius) {
        System.out.println("[log] entrada " + thisJoinPoint.getSignature().toShortString()
            + " com celsius = " + celsius);
    }

    after() returning (double fahrenheit):
            execution(double Exer6Conversor.celsiusParaFahrenheit(double)) {
        System.out.println("[log] saida fahrenheit = " + fahrenheit);
    }

    after() returning (String texto):
            execution(String Exer6Conversor.rotulo(String)) {
        System.out.println("[log] saida texto = \"" + texto + "\"");
    }
}
