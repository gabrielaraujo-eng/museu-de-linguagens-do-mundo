import ballerina/io;

// Tarefa: classificar o valor em relação a zero.
public function main() {
    int valor = 0;
    if valor > 0 {
        io:println("Maior que zero");
    } else if valor == 0 {
        io:println("Igual a zero");
    } else {
        io:println("Menor que zero");
    }
}
