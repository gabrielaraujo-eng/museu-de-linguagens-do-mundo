/*
 * exemplo_4.aj - Advice "around" com "proceed".
 *
 * "around" pode: (a) decidir nao chamar o metodo original e devolver outro
 * valor; (b) trocar os argumentos repassados ao metodo; (c) envolver a
 * execucao. O metodo original so roda se o advice chamar proceed(...).
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_4.aj
 * Executar: java -cp out:aspectjrt.jar Ex4Calculadora
 */

class Ex4Calculadora {

    public int dividir(int a, int b) {
        return a / b;
    }

    public int potencia(int base, int expoente) {
        int resultado = 1;
        for (int i = 0; i < expoente; i++) {
            resultado = resultado * base;
        }
        return resultado;
    }

    public static void main(String[] args) {
        Ex4Calculadora calc = new Ex4Calculadora();
        System.out.println("10 / 2 = " + calc.dividir(10, 2));
        System.out.println("10 / 0 = " + calc.dividir(10, 0));
        System.out.println("2 ^ 10 = " + calc.potencia(2, 10));
    }
}

aspect Ex4Protecao {

    /* (a) Intercepta a divisao por zero e devolve 0 sem executar o metodo. */
    int around(int a, int b):
            execution(int Ex4Calculadora.dividir(int, int)) && args(a, b) {
        if (b == 0) {
            System.out.println("[around] divisao por zero interceptada; devolvendo 0");
            return 0;
        }
        /* Como o advice declara retorno int, proceed(...) ja devolve int. */
        int resultado = proceed(a, b);
        return resultado;
    }

    /* (b) Normaliza o argumento antes de repassar ao metodo original. */
    int around(int base, int expoente):
            execution(int Ex4Calculadora.potencia(int, int)) && args(base, expoente) {
        if (expoente < 0) {
            System.out.println("[around] expoente negativo normalizado para 0");
            int resultado = proceed(base, 0);
            return resultado;
        }
        int resultado = proceed(base, expoente);
        return resultado;
    }
}
