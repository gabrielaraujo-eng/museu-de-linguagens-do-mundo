import ballerina/io;

function obterResultado() returns int|error {
    return error("falha simulada");
}

public function main() {
    int|error resultado = obterResultado();
    if resultado is error {
        io:println("Erro detectado");
    } else {
        io:println("Resultado: ", resultado);
    }
}
