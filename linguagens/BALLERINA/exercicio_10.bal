import ballerina/io;

// Tarefa: ordenar uma coleção de inteiros em ordem crescente.
public function main() {
    int[] valores = [8, 3, 6, 1];
    int[] ordenados = from var valor in valores
        order by valor ascending
        select valor;
    io:println(ordenados);
}
