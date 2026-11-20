/*
 * exercicio_8.aj - Acrescentar estado e comportamento a uma classe fechada.
 *
 * Tarefa: dar a Exer8Produto a capacidade de guardar um percentual de
 * desconto e calcular o preco final, sem editar a classe original.
 *
 * Solucao: declaracoes inter-tipo - um campo privado do aspecto e tres
 * metodos publicos injetados em Exer8Produto.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_8.aj
 * Executar: java -cp out:aspectjrt.jar Exer8Produto
 */

class Exer8Produto {

    private final String nome;
    private final double preco;

    public Exer8Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public static void main(String[] args) {
        Exer8Produto produto = new Exer8Produto("Teclado", 200.0);
        System.out.println(produto.getNome() + " custa " + produto.getPreco());

        produto.aplicarDesconto(15.0);
        System.out.println("desconto aplicado: " + produto.getPercentualDesconto() + "%");
        System.out.println("preco com desconto: " + produto.getPrecoComDesconto());
    }
}

aspect Exer8Desconto {

    /* Campo novo: percentual de desconto, privado ao aspecto. */
    private double Exer8Produto.percentual = 0.0;

    public void Exer8Produto.aplicarDesconto(double percentual) {
        if (percentual < 0.0 || percentual > 100.0) {
            throw new IllegalArgumentException("percentual fora de 0..100: " + percentual);
        }
        this.percentual = percentual;
    }

    public double Exer8Produto.getPercentualDesconto() {
        return percentual;
    }

    public double Exer8Produto.getPrecoComDesconto() {
        return getPreco() * (1.0 - percentual / 100.0);
    }
}
