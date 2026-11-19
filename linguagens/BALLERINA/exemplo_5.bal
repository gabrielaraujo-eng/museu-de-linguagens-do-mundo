import ballerina/io;

function soma(int a, int b) returns int {
    return a + b;
}

public function main() {
    io:println(soma(2, 3));
}
