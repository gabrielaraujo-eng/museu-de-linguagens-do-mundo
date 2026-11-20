// exercicio_8.as - interface IAnimal e polimorfismo com handles
//
// Tarefa: definir uma interface com dois metodos, implementa-la em duas
// classes e chamar os metodos por handles de interface, sem saber o tipo
// concreto de cada objeto.

interface IAnimal
{
    string som() const;
    string especie() const;
    int patas() const;
}

class Cachorro : IAnimal
{
    private string nomeAnimal;

    Cachorro(const string &in n) { nomeAnimal = n; }

    string som() const { return "latido"; }
    string especie() const { return "cachorro"; }
    int patas() const { return 4; }
    string get_nome() const property { return nomeAnimal; }
}

class Galinha : IAnimal
{
    private string nomeAnimal;

    Galinha(const string &in n) { nomeAnimal = n; }

    string som() const { return "cacarejo"; }
    string especie() const { return "galinha"; }
    int patas() const { return 2; }
    string get_nome() const property { return nomeAnimal; }
}

// Funcao que depende apenas da interface.
void apresentar(IAnimal@ animal)
{
    if (animal is null)
    {
        print("animal nulo, nada a apresentar");
        return;
    }
    print(animal.especie() + " faz " + animal.som() + " e tem "
          + animal.patas() + " patas");
}

void main()
{
    Cachorro rex("Rex");
    Galinha carijo("Carijo");

    IAnimal@ a = rex;
    IAnimal@ b = carijo;
    apresentar(a);
    apresentar(b);

    // Array de handles de interface percorrido com polimorfismo.
    array<IAnimal@> animais;
    animais.insertLast(@rex);
    animais.insertLast(@carijo);
    animais.insertLast(@Cachorro("Bolt"));

    int totalPatas = 0;
    for (uint i = 0; i < animais.length(); i++)
    {
        totalPatas += animais[i].patas();
    }
    print("animais: " + animais.length() + ", patas somadas: " + totalPatas);

    // Recuperar o tipo concreto com cast<> e acessar um atributo da classe.
    Cachorro@ comoCachorro = cast<Cachorro>(animais[0]);
    if (comoCachorro !is null)
        print("primeiro animal e o cachorro " + comoCachorro.nome);

    Galinha@ naoCachorro = cast<Galinha>(animais[0]);
    print("cast do primeiro animal para Galinha devolve null: " + (naoCachorro is null));

    apresentar(null);
}
