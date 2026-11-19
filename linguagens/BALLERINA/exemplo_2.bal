import ballerina/io;

string texto = "Ballerina";
int quantidade = 42;

public function main() {
    io:println("Texto: ", texto);
    io:println("Inteiro: ", quantidade);
}
