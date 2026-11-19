import ballerina/io;

// Tarefa: calcular a área de um retângulo por meio de uma função.
function areaRetangulo(int largura, int altura) returns int {
    return largura * altura;
}

public function main() {
    io:println(areaRetangulo(4, 3));
}
