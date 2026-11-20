/**
 * exemplo_9.cls - Matemática e precisão decimal
 *
 * Tópico: funções da classe Math (abs, mod, max, min, pow, sqrt) e o
 * tratamento de Decimal, que é o tipo correto para dinheiro porque evita os
 * erros de arredondamento do ponto flutuante binário.
 *
 * Execute Anonymous: exemplo_9.executar();
 */
public class exemplo_9 {

    public static void executar() {
        // Funções com Integer.
        System.debug('Math.abs(-7) = ' + Math.abs(-7));
        System.debug('Math.mod(17, 5) = ' + Math.mod(17, 5));
        System.debug('Math.max(3, 9) = ' + Math.max(3, 9));
        System.debug('Math.min(3, 9) = ' + Math.min(3, 9));

        // Funções com Double.
        Double potencia = Math.pow(2.0, 10.0);
        Double raiz = Math.sqrt(144.0);
        System.debug('2^10 = ' + potencia);
        System.debug('raiz de 144 = ' + raiz);

        // Decimal: casas decimais controladas com setScale.
        Decimal pi = 3.14159;
        System.debug('pi = ' + pi);
        System.debug('pi com 2 casas = ' + pi.setScale(2));
        System.debug('pi com 4 casas = ' + pi.setScale(4));

        // Divisão com escala definida: divide(divisor, casas decimais).
        Decimal dez = 10;
        Decimal tres = 3;
        System.debug('10 / 3 com 4 casas = ' + dez.divide(tres, 4));
        System.debug('10 / 3 com 2 casas = ' + dez.divide(tres, 2));

        // Precisão: Decimal não acumula o erro do Double.
        Decimal a = 0.1;
        Decimal b = 0.2;
        Double x = 0.1;
        Double y = 0.2;
        System.debug('Decimal 0.1 + 0.2 = ' + (a + b));
        System.debug('Double  0.1 + 0.2 = ' + (x + y));

        // Aplicação: hipotenusa e área com arredondamento.
        Double catetoA = 3.0;
        Double catetoB = 4.0;
        Double hipotenusa = Math.sqrt(Math.pow(catetoA, 2) + Math.pow(catetoB, 2));
        System.debug('Hipotenusa de 3 e 4 = ' + hipotenusa);

        Decimal raio = 2;
        Decimal area = pi * raio * raio;
        System.debug('Área do círculo de raio 2 = ' + area.setScale(2));

        // Resto negativo: Math.mod acompanha o sinal do dividendo.
        System.debug('Math.mod(-7, 3) = ' + Math.mod(-7, 3));
    }
}
