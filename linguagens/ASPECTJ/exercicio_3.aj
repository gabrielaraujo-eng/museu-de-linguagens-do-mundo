/*
 * exercicio_3.aj - Validacao de argumentos com "around".
 *
 * Tarefa: recusar retiradas de estoque com quantidade menor ou igual a zero,
 * lancando IllegalArgumentException, sem tocar no metodo retirar(int).
 *
 * Solucao: "around" examina o argumento exposto por args(); se ele for
 * invalido, lanca a excecao e nem chama proceed(). Caso contrario, repassa a
 * chamada ao metodo original.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_3.aj
 * Executar: java -cp out:aspectjrt.jar Exer3Estoque
 */

class Exer3Estoque {

    private int unidades = 10;

    public void retirar(int quantidade) {
        unidades = unidades - quantidade;
        System.out.println("  retirada de " + quantidade + " unidade(s)");
    }

    public int getUnidades() {
        return unidades;
    }

    public static void main(String[] args) {
        Exer3Estoque estoque = new Exer3Estoque();
        estoque.retirar(5);
        try {
            estoque.retirar(-3);
        } catch (IllegalArgumentException e) {
            System.out.println("recusado: " + e.getMessage());
        }
        System.out.println("estoque final: " + estoque.getUnidades());
    }
}

aspect Exer3Validacao {

    void around(int quantidade):
            execution(void Exer3Estoque.retirar(int)) && args(quantidade) {
        if (quantidade <= 0) {
            throw new IllegalArgumentException(
                "quantidade deve ser positiva (recebido: " + quantidade + ")");
        }
        proceed(quantidade);
    }
}
