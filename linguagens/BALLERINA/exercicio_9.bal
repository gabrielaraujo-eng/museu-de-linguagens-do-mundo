import ballerina/io;

// Tarefa: calcular o perímetro de um retângulo.
public function main() {
    int largura = 4;
    int altura = 3;
    int perimetro = 2 * (largura + altura);
    io:println(perimetro);
}
