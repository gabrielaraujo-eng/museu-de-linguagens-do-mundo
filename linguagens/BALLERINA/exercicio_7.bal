import ballerina/io;

// Tarefa: reconhecer o ramo de erro de um resultado int|error.
function buscarNumero(boolean encontrado) returns int|error {
    if encontrado {
        return 42;
    }
    return error("número não encontrado");
}

public function main() {
    int|error resultado = buscarNumero(false);
    if resultado is error {
        io:println("Erro detectado");
    } else {
        io:println("Número: ", resultado);
    }
}
