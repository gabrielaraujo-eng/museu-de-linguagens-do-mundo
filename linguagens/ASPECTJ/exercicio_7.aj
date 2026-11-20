/*
 * exercicio_7.aj - Controle de acesso com "within" e "around".
 *
 * Tarefa: permitir que apenas a classe Exer7Autorizado abra o cofre; qualquer
 * outra chamada deve falhar com SecurityException.
 *
 * Solucao: "around" sobre call(void Exer7Cofre.abrir()) combinado com
 * "!within(Exer7Autorizado)". O advice lanca a excecao em vez de chamar
 * proceed(), portanto o metodo nem chega a executar.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exercicio_7.aj
 * Executar: java -cp out:aspectjrt.jar Exer7Sistema
 */

class Exer7Cofre {

    public void abrir() {
        System.out.println("  [cofre] aberto");
    }
}

class Exer7Autorizado {

    public void usar(Exer7Cofre cofre) {
        cofre.abrir();
    }
}

class Exer7Sistema {

    public static void main(String[] args) {
        Exer7Cofre cofre = new Exer7Cofre();
        try {
            cofre.abrir();   /* chamada direta: bloqueada */
        } catch (SecurityException e) {
            System.out.println("bloqueado: " + e.getMessage());
        }
        new Exer7Autorizado().usar(cofre);   /* caminho permitido */
    }
}

aspect Exer7Seguranca {

    void around(): call(void Exer7Cofre.abrir()) && !within(Exer7Autorizado) {
        throw new SecurityException("apenas Exer7Autorizado pode abrir o cofre");
    }
}
