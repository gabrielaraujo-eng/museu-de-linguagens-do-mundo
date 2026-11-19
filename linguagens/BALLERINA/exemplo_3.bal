import ballerina/io;

public function main() {
    int i = 10;
    if i > 10 {
        io:println("Maior que 10");
    } else if i == 10 {
        io:println("Igual a 10");
    } else {
        io:println("Menor que 10");
    }
}
