/*
 * exemplo_8.aj - Declaracao inter-tipo (inter-type declaration, ITD).
 *
 * Um aspecto pode adicionar campos e metodos a tipos existentes, como se
 * fossem membros da propria classe:
 *
 *     private int Ex8Visitante.visitas = 0;      -> novo campo
 *     public void Ex8Visitante.registrarVisita() -> novo metodo
 *
 * O campo declarado como "private" so e visivel dentro do aspecto; o metodo
 * publico funciona como a interface exposta pela classe aumentada.
 *
 * Compilar: java -cp aspectjtools.jar org.aspectj.tools.ajc.Main \
 *              -cp aspectjrt.jar -d out exemplo_8.aj
 * Executar: java -cp out:aspectjrt.jar Ex8Visitante
 */

class Ex8Visitante {

    private final String nome;

    public Ex8Visitante(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public static void main(String[] args) {
        Ex8Visitante carla = new Ex8Visitante("Carla");
        Ex8Visitante diego = new Ex8Visitante("Diego");

        carla.registrarVisita();
        carla.registrarVisita();
        diego.registrarVisita();

        System.out.println(carla.getNome() + ": " + carla.getVisitas() + " visita(s)");
        System.out.println(diego.getNome() + ": " + diego.getVisitas() + " visita(s)");
    }
}

aspect Ex8Metricas {

    /* Campo novo em Ex8Visitante, invisivel fora deste aspecto. */
    private int Ex8Visitante.visitas = 0;

    /* Contador global mantido no proprio aspecto. */
    private static int totalDeVisitas = 0;

    /* Metodos novos em Ex8Visitante. */
    public void Ex8Visitante.registrarVisita() {
        visitas = visitas + 1;
        totalDeVisitas = totalDeVisitas + 1;
    }

    public int Ex8Visitante.getVisitas() {
        return visitas;
    }

    /* Advice sobre a execucao do main: resume o total ao final. */
    after(): execution(public static void Ex8Visitante.main(String[])) {
        System.out.println("[itd] total de visitas registradas: " + totalDeVisitas);
    }
}
