import ballerina/io;

// Tarefa: somar os elementos de um array de inteiros.
public function main() {
    int[] numeros = [2, 3, 5];
    int total = 0;
    foreach int numero in numeros {
        total = total + numero;
    }
    io:println(total);
}
