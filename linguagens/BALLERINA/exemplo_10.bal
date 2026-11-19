import ballerina/io;

public function main() {
    int[] valores = [5, 2, 4, 1];
    int[] ordenados = from var valor in valores
        order by valor ascending
        select valor;
    io:println(ordenados);
}
