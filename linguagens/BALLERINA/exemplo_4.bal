import ballerina/io;

public function main() {
    foreach int x in 1...5 {
        io:println(x);
    }
}
