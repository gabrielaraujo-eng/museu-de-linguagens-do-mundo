import ballerina/io;

// Tarefa: imprimir o quadrado de cada inteiro de 1 a 5.
public function main() {
    foreach int numero in 1...5 {
        io:println(numero * numero);
    }
}
