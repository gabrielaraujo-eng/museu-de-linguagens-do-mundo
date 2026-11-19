import ballerina/io;

// Tarefa: declarar e imprimir um nome e uma idade.
public function main() {
    string nome = "Lia";
    int idade = 12;
    io:println("Nome: ", nome);
    io:println("Idade: ", idade);
}
