/*
 * exercicio_9.aj - Ordenacao de objetos com "declare parents" e ITD.
 *
 * Tarefa: ordenar uma lista de Exer9Aluno por nota, sem alterar a classe do
 * aluno (que nao declara "implements Comparable").
 *
 * Solucao: "declare parents" faz Exer9Aluno implementar Comparable e
 * Serializable; uma declaracao inter-tipo fornece compareTo(Object). O
 * "declare warning" avisa sobre chamadas a List.add.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_9.aj
 * Executar: java -cp out:aspectjrt.jar Exer9Aluno
 */

class Exer9Aluno {

    private final String nome;
    private final double nota;

    public Exer9Aluno(String nome, double nota) {
        this.nome = nome;
        this.nota = nota;
    }

    public String getNome() {
        return nome;
    }

    public double getNota() {
        return nota;
    }

    public static void main(String[] args) {
        Exer9Aluno ana = new Exer9Aluno("Ana", 8.5);
        Exer9Aluno bia = new Exer9Aluno("Bia", 9.1);

        System.out.println("ana.compareTo(bia) = " + ana.compareTo(bia));
        System.out.println("bia.compareTo(ana) = " + bia.compareTo(ana));
        System.out.println("Serializable? " + (ana instanceof java.io.Serializable));

        java.util.List<Exer9Aluno> turma = new java.util.ArrayList<Exer9Aluno>();
        turma.add(bia);
        turma.add(ana);
        ordenarPorNota(turma);
        for (Exer9Aluno aluno : turma) {
            System.out.println(aluno.getNome() + " - " + aluno.getNota());
        }
    }

    /* Ordenacao por selecao usando o compareTo que o aspecto injeta. */
    private static void ordenarPorNota(java.util.List<Exer9Aluno> lista) {
        for (int i = 0; i < lista.size() - 1; i++) {
            int menor = i;
            for (int j = i + 1; j < lista.size(); j++) {
                if (lista.get(j).compareTo(lista.get(menor)) < 0) {
                    menor = j;
                }
            }
            Exer9Aluno troca = lista.get(i);
            lista.set(i, lista.get(menor));
            lista.set(menor, troca);
        }
    }
}

aspect Exer9Ordenacao {

    declare parents: Exer9Aluno implements Comparable, java.io.Serializable;

    public int Exer9Aluno.compareTo(Object outro) {
        Exer9Aluno aluno = (Exer9Aluno) outro;
        return Double.compare(getNota(), aluno.getNota());
    }

    declare warning: call(* java.util.List.add(..)):
        "List.add em laco pode ser trocado pelo construtor que recebe colecao";
}
