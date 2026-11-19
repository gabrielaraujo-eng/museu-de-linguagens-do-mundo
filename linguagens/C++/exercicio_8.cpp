#include <iostream>
#include <string>

int main() {
    // size() retorna o número de caracteres armazenados nesta string ASCII.
    const std::string text = "C++";
    std::cout << "Comprimento: " << text.size() << '\n';
    return 0;
}
